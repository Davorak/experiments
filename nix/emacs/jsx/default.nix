{ stdenv, fetchgit, emacs, texinfo }:

stdenv.mkDerivation rec {
  name = "jsx-mode-47213";

  src = fetchgit {
    url = https://github.com/jsx/jsx-mode.el;
    rev = "47213429c09259126cddb5742482cfc444c70d50";
    sha256 = "085d1c6e2efad81b20653a05b4de34dda7c4a8610b64aee0c49fbaa012c0d190";
  };

  buildInputs = [ emacs texinfo ];

  installPhase = ''
    mkdir -p "$out/share/emacs/site-lisp"
    cp ./src/*.el ./src/*.elc  "$out/share/emacs/site-lisp/"
  '';

  meta = {
    homepage = "https://github.com/jsx/jsx-mode.el";
    description = "jsx-mode.el --- major mode for JSX";

    platforms = stdenv.lib.platforms.unix;
#    maintainers = [ stdenv.lib.maintainers.simons ];
  };
}
