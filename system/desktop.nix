{ pkgs, ... }:

{

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd}/bin/agreety --cmd niri-session";
      };
    };
  };

  programs.niri.enable = true;

  environment.systemPackages = with pkgs; [
    xwayland-satellite
  ];
}
