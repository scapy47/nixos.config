{ config, pkgs, ... }:

{
    imports = [
    	/etc/nixos/hardware-configuration.nix
    ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.eli.canTouchEfiVariables = true;

    networking.hostName = "Stella";

    users.users.shion = {
        isNormalUser = true;
        extraGroups = [ "networkmanager" "wheel" ];
        packages = with pkgs; [
        ];
    };

    nix.settings.experimental-features = [ "nix-command", "flakes" ];
}
