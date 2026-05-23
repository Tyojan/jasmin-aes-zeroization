/* C interface for the Jasmin AES library. */

#ifndef JASMIN_AES_H
#define JASMIN_AES_H

#include <immintrin.h>
#include <stdint.h>

__m128i AES__aes(__m128i key, __m128i in);
__m128i AES__invaes(__m128i key, __m128i in);

__m128i NB_AES_REG__enc(__m128i k, __m128i n, __m128i p);
__m128i NB_AES_REG__dec(__m128i k, __m128i n, __m128i c);

void NB_AES_MEM__enc(uint8_t cptr[16], const uint8_t kptr[16],
                     const uint8_t nptr[16], const uint8_t pptr[16]);
void NB_AES_MEM__dec(uint8_t pptr[16], const uint8_t kptr[16],
                     const uint8_t nptr[16], const uint8_t cptr[16]);

#endif
