# Currently not working
let pkgs = import <nixpkgs> {};
    callPackageEmacs = pkgs.newScope pkgs.emacs24Packages;
    spacemacs = callPackageEmacs ./default.nix {};
    myEmacs = pkgs.buildEnv {
      name = "spacemacs";
#      ignoreCollisions = true;
      paths = [ pkgs.emacs
                spacemacs
/*
                web-mode
                git-timemachine
                pkgs.emacs24Packages.flycheck
                pkgs.emacs24Packages.js2
                pkgs.emacs24Packages.haskellMode_head
                pkgs.emacs24Packages.structuredHaskellMode
                pkgs.emacs24Packages.idris

                pkgs.emacs24Packages.magit
*/
              ];
    };
in myEmacs
