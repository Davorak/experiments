
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
