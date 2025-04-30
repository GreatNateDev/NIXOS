{config, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    gimp
    dconf
    fzf
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