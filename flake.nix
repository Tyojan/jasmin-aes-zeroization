{
  description = "Jasmin AES zeroization";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
  };

  outputs = { self, nixpkgs }: {
    defaultPackage.x86_64-linux =
      with import nixpkgs {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };
      stdenv.mkDerivation {
        name = "jasmin-aes-zero";
        src = self;
        buildInputs = [
          gcc clang-tools jasmin-compiler
        ];
        buildPhase = "";
        installPhase = "touch $out";
      };
  };
}
