{ config, pkgs, ... }:

{

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  users.users.q3e4ir = {
    isNormalUser = true;
    description = "Yaroslav Durych";
    extraGroups = ["audio" "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  services.getty.autologinUser = "q3e4ir";

  networking.hostName = "nixos"; 
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Kyiv";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "uk_UA.UTF-8";
    LC_IDENTIFICATION = "uk_UA.UTF-8";
    LC_MEASUREMENT = "uk_UA.UTF-8";
    LC_MONETARY = "uk_UA.UTF-8";
    LC_NAME = "uk_UA.UTF-8";
    LC_NUMERIC = "uk_UA.UTF-8";
    LC_PAPER = "uk_UA.UTF-8";
    LC_TELEPHONE = "uk_UA.UTF-8";
    LC_TIME = "uk_UA.UTF-8";
  };

  hardware.pulseaudio.enable = true;
  nixpkgs.config.pulseaudio = true;
  hardware.pulseaudio.extraConfig = "load-module module-combine-sink";

  services.blueman.enable = true;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true; 
 
  security.polkit.enable = true;
  nixpkgs.config.allowUnfree = true;

  environment.variables = {
    SUDO_EDITOR = "codium";
    SYSTEMD_EDITOR = "codium";
    EDITOR = "codium";
    VISUAL = "codium";
  };

  fonts.packages = with pkgs; [
     (nerdfonts.override {
        fonts = [
          "JetBrainsMono"
        ];
      })
  ];

  environment.systemPackages = with pkgs; [

    #CLI
    git
    neofetch
    unzip
    ntfs3g
    polkit
    polkit_gnome
    lxsession

    #Software
    firefox-wayland
    kitty
    vscodium
    cinnamon.nemo-with-extensions
    telegram-desktop
    discord
    qbittorrent

    #UTILS
    waybar
    hyprpaper
    wofi
    pulseaudio
    pavucontrol
    pamixer
    networkmanagerapplet
    gnome.gnome-tweaks
    loupe
  ];

  programs.hyprland.enable = true;

  system.stateVersion = "24.05";
}
