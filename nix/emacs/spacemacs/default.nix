{ stdenv, fetchgit, emacs, texinfo }:

stdenv.mkDerivation rec {
  name = "spacemacs";

  src = spacemacs/.; # You will need to git clone this repo if you want to play
                     # with this file

/*
fetchgit {
    url = spacemacs/.;
    rev = "56de55fb23c43b983490e222d3a0fe227ec76d30";
    sha256 = "4b88573bd60d03af7142c597f017224bbec04b45b6769a43742e20ef1cf44a03";
  };
*/

  buildInputs = [ emacs texinfo ];

  installPhase = ''
    mkdir -p "$out/share/emacs"
    cp -r spacemacs/* "$out/share/emacs/"
  '';

  meta = {
    homepage = "https://github.com/syl20bnr/spacemacs.git";
    description = "spacemacs";

    platforms = stdenv.lib.platforms.unix;
#    maintainers = [ stdenv.lib.maintainers.simons ];
  };
}
