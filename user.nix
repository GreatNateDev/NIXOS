{config, pkgs, ...}:
{
    users.users.nate = {
    isNormalUser = true;
    description = "Nate";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };
}