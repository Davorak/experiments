{ stdenv, fetchgit, emacs, texinfo }:

stdenv.mkDerivation rec {
  name = "markdown-mode-63a40";

  src = fetchgit {
    url = git://jblevins.org/git/markdown-mode.git;
    rev = "63a40729684db7abbcf9a19320ff1555eeb9c963";
    sha256 = "c80254ffb2f52897a26065718cb48e6382578384b3c54bdd5eb9241230ba6313";
  };

  buildInputs = [ emacs texinfo ];

  installPhase = ''
    mkdir -p "$out/share/emacs/site-lisp"
    cp *.el *.elc  "$out/share/emacs/site-lisp/"
  '';

  meta = {
    homepage = "http://jblevins.org/projects/markdown-mode/";
    description = "markdown-mode is a major mode for editing Markdown-formatted text files in GNU Emacs. markdown-mode is free software, licensed under the GNU GPL.";

    platforms = stdenv.lib.platforms.unix;
#    maintainers = [ stdenv.lib.maintainers.simons ];
  };
}
