/* Test for the Jasmin AES static library. */

#include <stdint.h>
#include <stdio.h>
#include <string.h>

#include "aes.h"

static const uint8_t fips_key[16] = {
    0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
    0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f,
};
static const uint8_t fips_plain[16] = {
    0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
    0x88, 0x99, 0xaa, 0xbb, 0xcc, 0xdd, 0xee, 0xff,
};
static const uint8_t fips_cipher[16] = {
    0x69, 0xc4, 0xe0, 0xd8, 0x6a, 0x7b, 0x04, 0x30,
    0xd8, 0xcd, 0xb7, 0x80, 0x70, 0xb4, 0xc5, 0x5a,
};

static int failures = 0;

static void dump(const char *label, const uint8_t b[16]) {
  fprintf(stderr, "  %s ", label);
  for (int i = 0; i < 16; i++)
    fprintf(stderr, "%02x", b[i]);
  fputc('\n', stderr);
}

static void check_eq(const char *what, const uint8_t got[16],
                     const uint8_t want[16]) {
  if (memcmp(got, want, 16) == 0) {
    printf("ok   %s\n", what);
  } else {
    printf("FAIL %s\n", what);
    dump("got: ", got);
    dump("want:", want);
    failures++;
  }
}

static __m128i load(const uint8_t b[16]) {
  return _mm_loadu_si128((const __m128i *)b);
}
static void store(uint8_t b[16], __m128i v) {
  _mm_storeu_si128((__m128i *)b, v);
}

int main(void) {
  uint8_t buf[16], buf2[16];

  /* AES__aes against FIPS-197 vector. */
  store(buf, AES__aes(load(fips_key), load(fips_plain)));
  check_eq("AES__aes(fips_key, fips_plain) == fips_cipher", buf, fips_cipher);

  /* AES__invaes inverts AES__aes. */
  store(buf2, AES__invaes(load(fips_key), load(buf)));
  check_eq("AES__invaes(fips_key, ciphertext) == fips_plain", buf2, fips_plain);

  /* AES__invaes directly on the FIPS ciphertext. */
  store(buf, AES__invaes(load(fips_key), load(fips_cipher)));
  check_eq("AES__invaes(fips_key, fips_cipher) == fips_plain", buf, fips_plain);

  /* NB_AES_REG round-trip: dec(k,n,enc(k,n,p)) == p. */
  {
    __m128i k = load(fips_key);
    __m128i n = load(fips_plain); /* arbitrary 16-byte nonce */
    const uint8_t p_in[16] = {
        0xde, 0xad, 0xbe, 0xef, 0xca, 0xfe, 0xba, 0xbe,
        0x01, 0x23, 0x45, 0x67, 0x89, 0xab, 0xcd, 0xef,
    };
    __m128i c = NB_AES_REG__enc(k, n, load(p_in));
    store(buf, NB_AES_REG__dec(k, n, c));
    check_eq("NB_AES_REG__dec(k,n,NB_AES_REG__enc(k,n,p)) == p", buf, p_in);
  }

  /* NB_AES_MEM round-trip plus cross-check that REG and MEM agree. */
  {
    const uint8_t p_in[16] = {
        0xde, 0xad, 0xbe, 0xef, 0xca, 0xfe, 0xba, 0xbe,
        0x01, 0x23, 0x45, 0x67, 0x89, 0xab, 0xcd, 0xef,
    };
    uint8_t c_mem[16], p_back[16];
    NB_AES_MEM__enc(c_mem, fips_key, fips_plain, p_in);
    NB_AES_MEM__dec(p_back, fips_key, fips_plain, c_mem);
    check_eq("NB_AES_MEM__dec(k,n,NB_AES_MEM__enc(k,n,p)) == p", p_back, p_in);

    store(buf, NB_AES_REG__enc(load(fips_key), load(fips_plain), load(p_in)));
    check_eq("NB_AES_REG__enc and NB_AES_MEM__enc agree", buf, c_mem);
  }

  if (failures == 0) {
    puts("all tests passed");
    return 0;
  }
  printf("%d test(s) failed\n", failures);
  return 1;
}
