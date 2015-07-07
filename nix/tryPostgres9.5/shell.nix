# { pkgs ? (import /home/pjw/code/external/nixpkgs {}).pkgs }:
{ pkgs ? (import <nixpkgs> {}).pkgs }:

let

  lib = pkgs.haskell-ng.lib;
  postgres = pkgs.callPackage ./9.5.x.nix {};


#  devEmacs = import /home/pjw/code/emacs/release.nix;

in

pkgs.stdenv.mkDerivation {
  name = "postgres-test";
  buildInputs = [ postgres ];
  shellHook = ''
  '';
}
