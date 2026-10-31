{ pkgs, ... }: {

  boot.kernelPackages = pkgs.linuxPackages_zen;

  networking.wireless.enable = true;

  hardware = {
    enableRedistributableFirmware = true;

    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };

    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };

  services.tlp = {
    enable = true;
    pd.enable = true;
  };

  security.tpm2.enable = true;

}
