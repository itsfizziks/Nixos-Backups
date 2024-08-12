# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:


{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      <home-manager/nixos>
    ];


    # Allow unfree packages
    nixpkgs.config = {
      allowUnfree = true;
    };

    # User account
    users.users.pouls0n = {
      isNormalUser = true;
      description = "pouls0n";
      extraGroups = [ "networkmanager" "wheel" "vboxusers" ];
    };

  nix.settings.experimental-features = [ "nix-command" ];
  #virtualisation.vmware.host.enable = true;
  virtualisation.virtualbox.host.enable = true;
  #virtualisation.virtualbox.guest.enable = true;
  hardware.bluetooth.enable = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nwordOS-Thinker"; # Define your hostname.
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Toronto";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_CA.UTF-8";

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  programs.steam.enable = true;
  programs.thunar.enable = true;

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  # For Intel graphics
  hardware.opengl = {
  enable = true;
  extraPackages = with pkgs; [ intel-media-driver ];
  };

  # Enable KDE 6
  #services.desktopManager.plasma6.enable = true;

  # Enable GNOME
  services.xserver.desktopManager.gnome.enable = true;

  # Select a display manager. You cannot enable both GDM and SDDM at the same time.
  # You have to choose one.

  # Enable SDDM (for KDE)
  #services.xserver.displayManager.sddm.enable = true;
  #services.xserver.displayManager.sddm.wayland.enable = true;

  # OR

  # Enable GDM (for GNOME)
  services.xserver.displayManager.gdm.enable = true;


  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  #sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;




  # List packages installed in system profile. To search, run:
  # $ nix search wget

  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
     wget
     wineWowPackages.stable
     htop
     git
     python3
     python3Packages.pip
     binutils
     gnupg
     clang
     bluez
     rustup
     gnome-tweaks
     apple-cursor
     firefox
     fastfetch
     kitty
  ];


  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];



  fonts.packages = with pkgs; [
     nerdfonts
  ];


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
