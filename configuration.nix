{ config, pkgs, ... }:

{
  #Imports 
  imports = [ ./hardware-configuration.nix ./gnome-cleaner.nix ./locales.nix ./user.nix ./audio.nix ./printing.nix ./desktop.nix ./packages.nix];
  #BootLoader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  #Networking
  networking.hostName = "Linux";
  networking.networkmanager.enable = true;
  #Version
  system.stateVersion = "25.05";
}
