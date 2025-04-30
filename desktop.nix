{config, pkgs, ...}:
{
  services.xserver = {
    enable = false;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
  };
}