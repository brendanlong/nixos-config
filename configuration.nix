# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub = {
    enable = true;
    version = 1;
    device = "nodev";
    extraPerEntryConfig = "root (hd0)";
  };

  networking.hostName = "brendanlong.com";
  networking.hostId = "7910d02f";

  # Select internationalisation properties.
  i18n = {
    consoleFont = "lat9w-16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    git
    wget
  ];

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.blong = {
    isNormalUser = true;
    uid = 1000;
    extraGroups = ["wheel"];
    openssh.authorizedKeys.keys = ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC7Zm+4e6OMlqelpX6guM7DwPmRj/mrDzE1kVUqxbAa6QWAhZQ0UfWR0wM9HG4addT+rTc+CDuPOeL2f4AU98trnI/CDTwiCtY9XkuBHtaqKoiSLhR1ZDOUch6p6oc4ElMgRLDRU4/LPEzXvEcPSJZa9nWMWTUrQeRHjdSVEbVr3Qn2hiQh9yOk6Fb/Mjzel+Xgtch5cyvnUs1Ip3N7fMT5qiuGYwH6RxIeJH86qeEL3EnQh8LfR+SnXQe+0+lEXEWChR6LmY7xcF3RgD9AfB7vI8zMbeu9y09cM4Q/S2+vVgdY1ByjgZzVEZiA2bDg3U2FYzDmKERjTQOGtm2sDJ+xbZhTTJj99/dqFePGL3dXHr7qEkepAnDIuuoTBv9AAv0jZ1mIHMt/dbHIz2s5/Y6Rrg41q5cm3Ot/7sjKrK2uSEX0RPEBTyyX9CQQ22vHgStzxiyrpDBM2ntEjG71/SHZ/uabsrHIIFRxxUtOoJztfihvWxhs2VuunXsmi1kRUrVRH5btBdQkiLJs9fR6CSoIFd3tSLZ13H9Q9yL5B9eQguUSxe0vUPRwBYiWPHg8Z4gUaZqojttDFRlf1Hv8Z9LH/9jt9wiXpK9O3xMEmzI2u4N353kNjmTpv1azM7LY/s9yu8o2MduGP7rJfuiEhu23QqjNUosXA36bpC1GNGyY0Q== blong@blong-desktop"];
  };

}

