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
      # It would be nice to enable SSHFP, but we need a local DNSSEC resolver for that to be safe
      knownHosts = [
        { hostNames = ["github.com"];
          publicKey = "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAq2A7hRGmdnm9tUDbO9IDSwBK6TbQa+PXYPCPy6rbTrTtw7PHkccKrpp0yVhp5HdEIcKr6pLlVDBfOLX9QUsyCOV0wzfjIJNlGEYsdlLJizHhbn2mUjvSAHQqZETYP81eFzLQNnPHt4EVVUh7VfDESU84KezmD5QlWpXLmvU31/yMf+Se8xhHTvKSCZIFImWwoG6mbUoWf9nzpIoaSjB+weqqUUmpaaasXVal72J+UX2B+2RPW3RcT0eOzQgqlJL3RKrTJvdsjE3JEAvGq3lGHSZXy28G3skua2SmVi/w4yCE6gbODqnTWlg7+wC604ydGXA8VJiS5ap43JXiUFFAaQ==";
        }
      ];
    };

    postfix = {
      enable = true;
      postmasterAlias = "blong";
      rootAlias = "blong";
      extraAliases = "self: blong";
    };

    syncthing = {
      enable = true;
      user = "blong";
      dataDir = "/home/blong";
    };
  };
}
