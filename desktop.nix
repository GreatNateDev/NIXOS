{pkgs, config, ...}:
{
  # Keep GNOME and dconf enabled
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    xkb.layout = "us";
  };

  programs.dconf.enable = true;

  # Run a script at login to apply dconf settings
  systemd.user.services.set-gnome-theme = {
    description = "Set GNOME dark theme using dconf";
    wantedBy = [ "default.target" ];
    script = ''
      ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/interface/color-scheme "'prefer-dark'"
      ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/interface/gtk-theme "'Adwaita-dark'"
    '';
  };
}
