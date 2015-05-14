{ stdenv, fetchgit, emacs, texinfo }:

stdenv.mkDerivation rec {
  name = "dash-2b69c";

  src = fetchgit {
    url = https://github.com/magnars/dash.el.git;
    rev = "2b69c146e419bebd495cd1ed9b1392f753ffb924";
    sha256 = "e51d5be57b7f3ced0737c9e7f28591167faccda2567edfff4531c34a86f2d8ef";
  };

  buildInputs = [ emacs texinfo ];

  installPhase = ''
    mkdir -p "$out/share/emacs/site-lisp"
    cp *.el *.elc  "$out/share/emacs/site-lisp/"
  '';

  meta = {
    homepage = "https://github.com/magnars/dash.el.git";
    description = "A modern list api for Emacs. No 'cl required.";

    platforms = stdenv.lib.platforms.unix;
#    maintainers = [ stdenv.lib.maintainers.simons ];
  };
}
