# This uses nix-shell to install the major pacakges but lets virtualenv and pip
# take care of everything in the config/requirments.txt file.
#
# This can be placed in the same directory as the cloned txrx.org repo and run
# with nix-shell
#
# txrx.org repo https://github.com/chriscauley/txrx.org
{ pkgs ? (import <nixpkgs> {}).pkgs }:

let

 pythonPackages = pkgs.pythonPackages;

in

pkgs.stdenv.mkDerivation {
  name = "nixShell.txrx.org";
  buildInputs = [

    pythonPackages.python
    pythonPackages.pip
    pythonPackages.virtualenv
    pythonPackages.psycopg2
    pythonPackages.pil
#    pythonPackages.pythonPackages.django_1_5
    pythonPackages.django_1_4
#    pythonPackages.django

    pkgs.libpng
    pkgs.libjpeg
    pkgs.gitAndTools.gitFull
  ];
#    echo "Remove virtualenv if it exists"
#    rm -r nixShellVirtualEnv
  shellHook = ''
    echo "Create new python virtualenv"
    virtualenv nixShellVirtualEnv14
    source nixShellVirtualEnv14/bin/activate

    echo "pip install depends"
    pip install -r config/requirements.txt

    pip install django-contrib-comments
    pip install django-markdown-deux
    pip install django-bootstrap-form
    pip install django-suit
    pip install south
  '';
}
