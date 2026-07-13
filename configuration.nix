{ config, pkgs, ... }:

{
    imports = [
    	/etc/nixos/hardware-configuration.nix
    ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.eli.canTouchEfiVariables = true;

    networking.hostName = "Stella";

    nix.settings.experimental-features = [ "nix-command", "flakes" ];
}
