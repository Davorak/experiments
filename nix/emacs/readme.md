
This can be installed on most nix based systems with:

`nix-env -f release.nix -i`

I however only used it on nixos and my macbook pro.


Mostly working emacs config for:

* dash
* evil-mode
* git-timemachine
* idris-mode -- Needs idris isntalled to do real work wh
* jsx
* markdown-mode
* projectile
* web-mode -- Set up to work with jsx in .emacs

All of these modules are loaded into one directory and loaded from .emacs. Any
file conflict should make the nix install fail, however it would still be nice
to the packages structured better.

### Issues

Not all command seem to working as advertised. I do not know currently if this
is due to an issue in the plugin or if it is my install method.

One example is `M-n` and `M-p` in idris's interactive proof mode.  Neither of
the short cuts work but the command work just fine.
