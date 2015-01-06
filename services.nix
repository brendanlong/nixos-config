{
  services.openssh = {
    enable = true;
    permitRootLogin = "no";
    passwordAuthentication = false;
  };

  services.syncthing = {
    enable = true;
    user = "blong";
    dataDir = "/home/blong";
  };
}
