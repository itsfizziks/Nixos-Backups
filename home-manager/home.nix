{ pkgs, ... }:

{
  home.username = "pouls0n";
  home.homeDirectory = "/home/pouls0n";
  home.packages = with pkgs; [
    steam
    bitwarden
    obsidian
    zed-editor
    fastfetch
    kitty
    vlc
    brightnessctl
    swww
    oh-my-posh
    nautilus
    hyprcursor
    pavucontrol
    pulseaudio
    vscode
  ];

  nixpkgs.config = {
    allowUnfree = true;
  };


  # Configure user settings
  home.stateVersion = "24.11";  # Update this if needed
}
