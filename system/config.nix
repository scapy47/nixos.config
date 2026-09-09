{ config, pkgs, ... }:

{
  imports = [
    /etc/nixos/hardware-configuration.nix
    ./desktop.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.eli.canTouchEfiVariables = true;

  networking.hostName = "Stella";

  users.users.shion = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      neovim
      git
      jujutsu
    ];
  };

  programs.zsh.enable = true;
  programs.starship = {
    enable = true;
    add_newline = false;
  };

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    auto-optimise-store = true;
    allowed-users = [ "@wheel" ];
  };
}
