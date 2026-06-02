{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

  outputs = { nixpkgs, ... }:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;

      typst = pkgs.typst.withPackages (p: [ p.modern-cv ]);

      fontsConf = pkgs.makeFontsConf {
        fontDirectories = [
          pkgs.font-awesome
          pkgs.source-sans
          pkgs.source-sans-pro
          pkgs.roboto
        ];
      };

    in
    {
      packages.x86_64-linux.default = pkgs.stdenv.mkDerivation {
        name = "jeancharles.quillet-en";
        src = ./.;

        buildInputs = [
          pkgs.tinymist
          pkgs.typstyle
          typst
        ];

        buildPhase = ''
          typst compile jeancharles.quillet-en.typ
        '';

        installPhase = ''
          mkdir $out
          cp jeancharles.quillet-en.pdf $out
        '';

        FONTCONFIG_FILE = "${fontsConf}";
      };
    };
}
