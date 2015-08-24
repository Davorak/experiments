# Standard nixpkgs location for emacs packages is currently:
# pkgs.emacs24Packages
# let pkgs = import <nixpkgs> {};
let pkgs = import /home/pjw/.nix-defexpr/channels/nixpkgs {};
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
                pkgs.emacs24Packages.js2
                pkgs.emacs24Packages.haskellMode
                pkgs.emacs24Packages.magit
              ];
    };
in myEmacs
