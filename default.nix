with import <nixpkgs> {};
# Exclude generated files
# https://discourse.nixos.org/t/mkderivation-src-as-list-of-filenames/3537/6
let patterns = ''
  *.pdf
  *.log
  *.out
  *.aux
'';
in stdenv.mkDerivation {
  name = "jeancharles-quillet-cv";
  src = nix-gitignore.gitignoreSourcePure patterns ./.;
  buildInputs = [ gnumake texlive.combined.scheme-full ];
}
