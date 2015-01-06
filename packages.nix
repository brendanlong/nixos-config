{ pkgs, ...} :

{
  environment.systemPackages = with pkgs; [
    git
    telnet
    wget
  ];
}
