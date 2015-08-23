{ stdenv, fetchhg, emacs, texinfo }:

stdenv.mkDerivation rec {
  name = "evil-43eqf";

/*
  src = fetchgit {
    url = git://gitorious.org/evil/evil.git;
    rev = "43eaf602960e9254a1389e0096639be301dcd716";
    sha256 = "abd80535259e3bdaf7d8bd560365b6e5b7d4f55215a2b6acdccbe717af5548d9";
  };
*/
  src = fetchhg {
    url = https://bitbucket.org/lyro/evil;
    rev = "54195f999341";
    sha256 = "13xggrkjmnxs7lcs8nijmrzmdhm4j9ccd5fz5knc9gyf7pgn9vlr";
  };

  buildInputs = [ emacs texinfo ];

  installPhase = ''
    mkdir -p "$out/share/emacs/site-lisp"
    cp *.el *.elc  "$out/share/emacs/site-lisp/"
    cp -r lib "$out/share/emacs/site-lisp/."
  '';

  meta = {
    homepage = "https://gitorious.org/evil/pages/Home";
    description = "Evil is an extensible vi layer for Emacs. It emulates the main features of Vim, and provides facilities for writing custom extensions.";

    platforms = stdenv.lib.platforms.unix;
#    maintainers = [ stdenv.lib.maintainers.simons ];
  };
}
