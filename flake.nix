{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
  outputs = { nixpkgs, ... }:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in
    {
      packages.x86_64-linux.default = pkgs.stdenv.mkDerivation {
        name = "jeancharles-quillet-cv";
        src = ./.;

        buildInputs = [
          pkgs.gnumake
          pkgs.texlive.combined.scheme-full
        ];

        buildPhase = ''
          make clean all
        '';

        installPhase= ''
          mkdir $out
          cp resume-fr/jeancharles.quillet-fr.pdf $out
          cp resume-en/jeancharles.quillet-en.pdf $out
          '';
      };
    };
}
