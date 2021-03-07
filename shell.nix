let pkgs = import <nixpkgs> {};
in pkgs.mkShell {
  buildInputs = [ pkgs.gnumake pkgs.texlive.combined.scheme-full ];
}
