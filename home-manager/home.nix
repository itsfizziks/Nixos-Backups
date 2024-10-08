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
    cmake
    dolphin-emu
    ntfs3g
    fzf
    tldr
    bat
    gimp
    unzip
    yazi
    lsd
    btop
    spotify
    libreoffice
    nmap
    wineWowPackages.stable
    xterm
  ];

  nixpkgs.config = {
    allowUnfree = true;
  };

  # Configure user settings
  home.stateVersion = "24.11";  # Update this if needed
}
