# To try phabricator out in the container:
# * Log in as root
# * Copy the phabricator dir from the /nix/store to a location of your choice
# * cd into the folder and call
# `php -S 0.0.0.0:3001 -t phabricator/webroot/ phabricator/webroot/index.php`
# * Phabricator's unresolved issues system will walk you through initializing
# the data base and starting the deamons.

services = {
  mysql.enable  = true;
  mysql.package = pkgs.mysql55;

  phd.enable = true;

  postfix.enable = true;

};

networking.firewall.allowedTCPPortRanges = [ {from = 3000; to = 3033;} ];

environment.systemPackages = [

    pkgs.php
    pkgs.phabricator

    pkgs.wget
    pkgs.curl

    pkgs.xsel

    pkgs.vimHugeX
    pkgs.emacs

    pkgs.sshfsFuse
    pkgs.fuse

    pkgs.file
    pkgs.which
    pkgs.xz

    pkgs.nmap

    pkgs.subversion
    pkgs.subversionClient
    pkgs.git
    pkgs.mercurial


  ];
