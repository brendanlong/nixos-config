{
  services = {
    httpd = {
      enable = true;
      adminAddr = "self@brendanlong.com";
      # Note, run the following:
      #   chmod 711 ~blong
      #   chown blong:wwwrun -R ~blong/public_html
      #   chmod g+s ~blong/public_html
      # Would be nice to figure out how to make nix do that.
      documentRoot = "/home/blong/public_html";
    };

    openssh = {
      enable = true;
      permitRootLogin = "no";
      passwordAuthentication = false;
    };

    syncthing = {
      enable = true;
      user = "blong";
      dataDir = "/home/blong";
    };
  };
}
