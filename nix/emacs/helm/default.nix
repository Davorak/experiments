{ stdenv, fetchgit, emacs, texinfo }:

stdenv.mkDerivation rec {
  name = "evil-43eqf";

  src = fetchgit {
    url = https://github.com/emacs-helm/helm.git;
    rev = "9eb7cd568fdd1b49110c3b5e08336478ec854aca";
    sha256 = "6c60b129ecc3c9baecd0458097237c208478698da9cc189cdf06a2fd19c8232b";
  };

  buildInputs = [ emacs texinfo ];

  installPhase = ''
    mkdir -p "$out/share/emacs/site-lisp"
    cp *.el *.elc  "$out/share/emacs/site-lisp/"
  '';

  meta = {
    homepage = "https://github.com/emacs-helm/helm.git";
    description = "Helm is incremental completion and selection narrowing framework for Emacs. It will help steer you in the right direction when you're looking for stuff in Emacs (like buffers, files, etc).";

    platforms = stdenv.lib.platforms.unix;
#    maintainers = [ stdenv.lib.maintainers.simons ];
  };
}
