{ stdenv, fetchurl, zlib, readline, libossp_uuid, openssl }:

with stdenv.lib;

let version = "9.4.1"; in

stdenv.mkDerivation rec {
  name = "postgresql-${version}";

  src = fetchurl {
#    url = "mirror://postgresql/source/v${version}/${name}.tar.bz2";
    url = "https://ftp.postgresql.org/pub/source/v9.5alpha1/postgresql-9.5alpha1.tar.bz2";
    sha256 = "18pwxi0hizdi3ah5ci77ba00h3wi7wksiz2km0phgs9rqpv7jxy9";
  };

  buildInputs = [ zlib readline openssl ]
                ++ optionals (!stdenv.isDarwin) [ libossp_uuid ];

  enableParallelBuilding = true;

  makeFlags = [ "world" ];

  configureFlags = [ "--with-openssl" ]
                   ++ optional (!stdenv.isDarwin) "--with-ossp-uuid";

  patches = [ ./disable-resolve_symlinks-94.patch ./less-is-more.patch ];

  installTargets = [ "install-world" ];

  LC_ALL = "C";

  passthru = {
    inherit readline;
    psqlSchema = "9.4";
  };

  meta = {
    homepage = http://www.postgresql.org/ ;
    description = "A powerful, open source object-relational database system";
    license = stdenv.lib.licenses.postgresql;
    maintainers = with stdenv.lib.maintainers; [ aristid ocharles ];
    hydraPlatforms = stdenv.lib.platforms.linux;
  };
}
