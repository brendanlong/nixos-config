{
  services.dovecot2 = {
    enable = true;
    enablePop3 = false;
  };
  networking.firewall.allowedTCPPorts = [ 143 ];
}
