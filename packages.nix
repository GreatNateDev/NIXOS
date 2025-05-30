{config, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    godot_4
    mpv
    wineWowPackages.stable
    rpi-imager
    f3
    gimp
    dconf
    fzf
    go
    fastfetch
    gnome-tweaks
    git
    python3
    bind
    github-desktop
    vscodium
    brave
    impression
    kdiskmark
    ventoy-full
    pkg-config
    libpng
    pkgsCross.arm-embedded.stdenv.cc
  ];
}