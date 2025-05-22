{config, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    godot_4
    mpv
    rpi-imager
    f3
    gimp
    dconf
    fzf
    go
    gnome-tweaks
    git
    python3
    bind
    github-desktop
    vscodium
    brave
    impression
    kdiskmark
    pkg-config
    libpng
    pkgsCross.arm-embedded.stdenv.cc
  ];
}