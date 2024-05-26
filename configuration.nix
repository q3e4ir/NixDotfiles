{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      /home/q3e4ir/.config/nixos/configuration.nix
    ];
}
