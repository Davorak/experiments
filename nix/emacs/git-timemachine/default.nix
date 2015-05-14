{ stdenv, fetchgit, emacs, texinfo }:

stdenv.mkDerivation rec {
  name = "git-timemachine-5aa26";

  src = fetchgit {
    url = https://github.com/pidu/git-timemachine;
    rev = "5aa266e6f669d3cad8316403d7f7056f2fb236e4";
    sha256 = "1de1b6ccde7c0a5dcd78335c8fdf24794831dfd7ee0d142015e1f6f918215fb5";
  };

  buildInputs = [ emacs texinfo ];

  installPhase = ''
    mkdir -p "$out/share/emacs/site-lisp"
    cp *.el *.elc  "$out/share/emacs/site-lisp/"
  '';

  meta = {
    homepage = "https://github.com/pidu/git-timemachine";
    description = "";

    platforms = stdenv.lib.platforms.unix;
#    maintainers = [ stdenv.lib.maintainers.simons ];
  };
}
