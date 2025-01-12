{ pkgs, ...}:
{ 
  home.username = "pouls0n";
  home.homeDirectory = "/home/pouls0n";

  home.packages = with pkgs; [
    steam
    bitwarden
    obsidian
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
    #vscode-fhs
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
    pywal
    hyprshot
    wireshark
    blueman
    dunst
    discord
   ];

  nixpkgs.config = {
    allowUnfree = true;
  };

  # Configure user settings
  home.stateVersion = "25.05";  # Update this if needed
  #24.11
}
