
This can be installed on most nix based systems with:

`nix-env -f release.nix -i`

I however only used it on nixos and my macbook pro.


Mostly working emacs config for:

* dash
* evil-mode
* git-timemachine
* idris-mode
* jsx
* markdown-mode
* projectile
* web-mode

All of these modules are loaded into one directory and loaded from .emacs. Any
file conflict should make the nix install fail, however it would still be nice
to the packages structured better.
