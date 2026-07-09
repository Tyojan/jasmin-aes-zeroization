/* Test for the 1 MiB AES-128-CTR Jasmin functions. */

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "aes.h"

#define TEST_LEN 1048576

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

static void check_eq16(const char *what, const uint8_t got[16],
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

static void check_eq_buf(const char *what, const uint8_t *got,
                         const uint8_t *want, size_t len) {
  if (memcmp(got, want, len) == 0) {
    printf("ok   %s\n", what);
  } else {
    printf("FAIL %s\n", what);
    failures++;
  }
}

int main(void) {
  uint8_t *plain = malloc(TEST_LEN);
  uint8_t *cipher = malloc(TEST_LEN);
  uint8_t *back = malloc(TEST_LEN);
  uint8_t *zero = calloc(TEST_LEN, 1);

  if (plain == NULL || cipher == NULL || back == NULL || zero == NULL) {
    fputs("allocation failed\n", stderr);
    free(plain);
    free(cipher);
    free(back);
    free(zero);
    return 1;
  }

  for (size_t i = 0; i < TEST_LEN; i++)
    plain[i] = (uint8_t)((i * 13u + i / 7u) & 0xffu);

  AES128_CTR__enc_1mb(cipher, plain, fips_key, fips_plain);
  AES128_CTR__dec_1mb(back, cipher, fips_key, fips_plain);
  check_eq_buf("AES128_CTR__dec_1mb(k,ctr,AES128_CTR__enc_1mb(...)) == plain",
               back, plain, TEST_LEN);

  AES128_CTR__enc_1mb(cipher, zero, fips_key, fips_plain);
  check_eq16("AES128_CTR__enc_1mb first block matches AES(key, counter)",
             cipher, fips_cipher);

  free(plain);
  free(cipher);
  free(back);
  free(zero);

  if (failures == 0) {
    puts("all tests passed");
    return 0;
  }
  printf("%d test(s) failed\n", failures);
  return 1;
}
