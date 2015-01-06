{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./packages.nix
      ./users.nix
      ./services.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub = {
    enable = true;
    version = 1;
    device = "nodev";
    extraPerEntryConfig = "root (hd0)";
  };

  swapDevices = [
    { device = "/var/swapfile";
      size = 2048;
    }
  ];

  networking = {
    hostName = "brendanlong.com";
    hostId = "7910d02f";
    firewall = {
      allowPing = true;
    };
  };

  i18n = {
    consoleFont = "lat9w-16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

}
