{ stdenv, fetchgit, emacs, texinfo }:

stdenv.mkDerivation rec {
  name = "web-mode-e71e1";

  src = fetchgit {
    url = https://github.com/fxbois/web-mode.git;
    rev = "e71e139cff740e3d7eb33abd011f9b10ed50da7a";
    sha256 = "a95a148f771835f1b771fc9d9a8ef98dca8bccc93469eb3c7bb5d378e861958f";
  };

  buildInputs = [ emacs texinfo ];

  installPhase = ''
    mkdir -p "$out/share/emacs/site-lisp"
    cp *.el *.elc  "$out/share/emacs/site-lisp/"
  '';

  meta = {
    homepage = "https://github.com/fxbois/web-mode.git";
    description = "web-mode.el is an emacs major mode for editing web templates aka HTML files embedding parts (CSS/JavaScript) and blocks (pre rendered by client/server side engines).";

    platforms = stdenv.lib.platforms.unix;
#    maintainers = [ stdenv.lib.maintainers.simons ];
  };
}
