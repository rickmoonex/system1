{ lib, config, pkgs, ... }:

let
  userName = "rick";
  userDescription = "Rick Moonen";
in
{
  options = {
  };
  config = {
    users.users.${userName} = {
      isNormalUser = true;
      description = userDescription;
      shell = pkgs.zsh; 
      extraGroups = [ "wheel"  "docker" "wireshark" ];
    };
    programs.zsh.enable = true;
  };
}
