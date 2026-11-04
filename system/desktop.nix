{ pkgs, ... }:

{

  services.greetd = {
    enable = true;
    # settings = {
    #   default_session = {
    #     command = "${pkgs.greetd}/bin/agreety --cmd niri-session";
    #   };
    # };
  };

  services.displayManager.noctalia-greeter = {
    enable = true;
    settings = {
      cursor.size = 24;
      keyboard.layout = "us";
    };
    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
    };
  };

  services.upower.enable = true;
  services.libinput.enable = true;

  xdg.portal = {
    enable = true;
  };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber = {
      enable = true;
    };
  };

  services.flatpak = {
    enable = true;
  };

  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  programs.niri = {
    enable = true;
  };

  programs.noctalia = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    xwayland-satellite
    matugen
    wezterm
  ];

}
