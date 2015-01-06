{
  services.postfix = {
    enable = true;
    postmasterAlias = "blong";
    rootAlias = "blong";
    extraAliases = "self: blong";
  };
  networking.firewall.allowedTCPPorts = [ 25 ];
}
