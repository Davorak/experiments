let pkgs = import <nixpkgs> {};
    callPackageEmacs = pkgs.newScope pkgs.emacs24Packages;
    emacsEvil = callPackageEmacs ./evil {};
    emacsJsx = callPackageEmacs ./jsx {};
    web-mode = callPackageEmacs ./web-mode {};
    git-timemachine = callPackageEmacs ./git-timemachine {};
    helm = callPackageEmacs ./helm {};
    projectile = callPackageEmacs ./projectile {};
    dash = callPackageEmacs ./dash {};
    markdown-mode = callPackageEmacs ./markdown-mode {};
    idris-mode = callPackageEmacs ./idris-mode {};
    myEmacs = pkgs.buildEnv {
      name = "myemacs";
#      ignoreCollisions = true;
      paths = [ pkgs.emacs
                emacsEvil
                web-mode
                git-timemachine
                helm
                projectile
                dash
                markdown-mode
                idris-mode
#                pkgs.emacs24Packages.flycheck
                pkgs.emacs24Packages.js2
#                pkgs.emacs24Packages.idris
#                pkgs.emacs24Packages.coffee
#                pkgs.emacs24Packages.jade
#                pkgs.emacs24Packages.php
#                pkgs.emacs24Packages.idris
#                pkgs.emacs24Packages.org
/*
                pkgs.emacs24Packages.haskellMode_head
                pkgs.emacs24Packages.structuredHaskellMode
                pkgs.emacs24Packages.idris

                pkgs.emacs24Packages.magit
*/
              ];
    };
in myEmacs
