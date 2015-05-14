{ stdenv, fetchgit, emacs, texinfo }:

stdenv.mkDerivation rec {
  name = "projectile-57f66";

  src = fetchgit {
    url = https://github.com/bbatsov/projectile.git;
    rev = "57f6684bb7bb0d668ff9409f683d5254731331c5";
    sha256 = "574ac85a8c0c392c0e162235285049bffe57227ac1d704d447646b341e92769a";
  };

  buildInputs = [ emacs texinfo ];

  buildPhase =''
    echo "build !!!!!!!!!!!!!!!!!"
  '';
/*
*/

  installPhase = ''
    mkdir -p "$out/share/emacs/site-lisp"
    cp *.el *.elc  "$out/share/emacs/site-lisp/"
  '';

  meta = {
    homepage = "https://github.com/bbatsov/projectile.git";
    description = "Projectile is a project interaction library for Emacs. Its goal is to provide a nice set of features operating on a project level without introducing external dependencies(when feasible). For instance - finding project files has a portable implementation written in pure Emacs Lisp without the use of GNU find (but for performance sake an indexing mechanism backed by external commands exists as well).";

    platforms = stdenv.lib.platforms.unix;
#    maintainers = [ stdenv.lib.maintainers.simons ];
  };
}
