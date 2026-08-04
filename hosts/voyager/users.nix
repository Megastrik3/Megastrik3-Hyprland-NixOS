# Users - NOTE: Packages defined on this will be on current user only

{ pkgs, username, pkgs-cuda, ... }:

let
  inherit (import ./variables.nix) gitUsername;
  hyprlandScripts = import ./scripts { inherit pkgs; };
  hyprlandUserScripts = import ./userscripts { inherit pkgs; };
in
{
  users = { 
    mutableUsers = true;
    users."${username}" = {
      homeMode = "755";
      isNormalUser = true;
      initialPassword = "nixos";
      shell = pkgs.zsh;
      description = "${gitUsername}";
      extraGroups = [
        "networkmanager"
        "wheel"
        "libvirtd"
        "scanner"
        "lp"
        "video" 
        "input" 
        "audio"
        "adbusers" 
      ];

    # define user packages here
    packages = (with pkgs; [


    ]) ++ hyprlandScripts ++ hyprlandUserScripts;
    };
    
    defaultUserShell = pkgs.zsh;
  }; 
  
  environment.shells = with pkgs; [ zsh ];
  environment.systemPackages = with pkgs; [ lsd fzf ]; 
  
}
