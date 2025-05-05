{config, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    godot_4
    mpv
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
    pkg-config
    libpng
    pkgsCross.arm-embedded.stdenv.cc
  ];
}