{config, pkgs, ...}:
{
  programs.dconf.enable = true;
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark"; 
      gtk-theme = "Adwaita-dark";   
    };
  };
  environment.sessionVariables.GTK_THEME = "Adwaita-dark";
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