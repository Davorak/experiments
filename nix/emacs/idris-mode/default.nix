{ stdenv, fetchgit, emacs, texinfo }:

stdenv.mkDerivation rec {
  name = "idris-mode-47213";

  src = fetchgit {
    url = https://github.com/idris-hackers/idris-mode.git;
    rev = "fbe1c6c585df96f307b0bb5321ea454d982a8583";
    sha256 = "db2e70b59fdc58985835b6c1fa0dbed6fb3db0567df3c983ddc732ef129d69f2";
  };

  buildInputs = [ emacs texinfo ];

  installPhase = ''
    mkdir -p "$out/share/emacs/site-lisp"
    cp ./*.el ./*.elc  "$out/share/emacs/site-lisp/"
  '';

  meta = {
    homepage = "https://github.com/idris-hackers/idris-mode";
    description = "This is an emacs mode for editing Idris code.";

    platforms = stdenv.lib.platforms.unix;
#    maintainers = [ stdenv.lib.maintainers.simons ];
  };
}
