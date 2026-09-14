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

  #  TODO: look into the research i did

  programs.niri.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-generic
    ];

    config = {
      # common = {
      #   default = [ "sh" ];
      # };
    };
  };

  environment.systemPackages = with pkgs; [
    xwayland-satellite
  ];
}
