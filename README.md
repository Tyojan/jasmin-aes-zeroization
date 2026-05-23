# AES stack zeroization in Jasmin

In `src/`:

- `aes.jinc`: AES-NI primitives (key schedule, rounds, inverse).
- `aes.jazz`: exported entrypoints: `AES__aes` and `AES__invaes`, the
  nonce-based PRF wrappers `NB_AES_REG__{enc,dec}` (register I/O) and
  `NB_AES_MEM__{enc,dec}` (16-byte arrays I/O).

## Dependencies

The only dependency is the Jasmin compiler. Using the provided `flake.nix`, you
can get it with:
```sh
nix develop
```
(or `nix-shell` on older Nix).

Otherwise, you can install it following the installation guide
https://jasmin-lang.readthedocs.io/en/stable/misc/installation_guide.html.
There are debian and opam packages.

## Building

Default target compiles `src/aes.jazz` into `output/` thirteen times: once
with no zeroization, and once each for `-stack-zero {loop,unrolled}` at every
supported chunk size:
```sh
make
```
build everything.

Produced files:

- `output/aes.s`: standard compilation, no stack zeroization.
- `output/aes_zero_loop_<N>.s` for `N` in `8, 16, 32, 64, 128, 256`:
   compiled with `-stack-zero loop -stack-zero-size u<N>`.
- `output/aes_zero_unrolled_<N>.s`: same chunk sizes, with
  `-stack-zero unrolled`.

To build a single variant, name it directly:
```sh
make output/aes_zero_loop_64.s
```

You can override the compiler with `JASMINC=...` if needed (default: `jasminc`
from `PATH`). You can override compiler flags with `JFLAGS=...` (default:
empty).

## Static library from C

`make` (or `make libs`) also assembles each `.s` into an object file and
packages it into its own static archive under `output/`:

- `output/libaes.a`
- `output/libaes_zero_loop_<N>.a`
- `output/libaes_zero_unrolled_<N>.a`

The C interface is declared in `include/aes.h`. Every archive exposes the
same symbols (`AES__aes`, `AES__invaes`, `NB_AES_REG__{enc,dec}`,
`NB_AES_MEM__{enc,dec}`), so you can pick exactly one variant per binary.
Example link line:

```sh
cc -maes -msse2 <file>.c path/to/output/libaes_zero_loop_64.a -o <file>
```

The implementation requires AES-NI; build sites that use the register-typed
entrypoints need `<immintrin.h>` (the header pulls it in automatically).
Override the C toolchain with `CC=...` if needed (default: `cc`).

## Test

`make test` builds and runs `test/aes_test.c` against `output/libaes.a`. It
checks the FIPS-197 Appendix B AES-128 test vector against `AES__aes` and
`AES__invaes`, and verifies round-trip equality for the `NB_AES_REG` and
`NB_AES_MEM` wrappers.
