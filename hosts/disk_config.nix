{
  device ? [ "/dev/sda" ],
  ...
}:

{
  disko.devices = {
    my-drive = {
      inherit device;
      type = "disk";
      content = {
        type = "gpt";
        partitions = {
          ESP = { };
          root = { };
        };
      };
    };
  };
}
