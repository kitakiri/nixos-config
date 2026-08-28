{pkgs, ...}: {
  boot.loader.systemd-boot.enable = true;

  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Должно помочь с тем чтобы usb устройства на desktop пробуждали пк из сна
  # (естественно нужно и в uefi выключить ErP Ready и включить пробуждение по usb)
  services.udev.extraRules = ''
    # Автоматическое включение пробуждения для всех USB-устройств
    ACTION=="add", SUBSYSTEM=="usb", ATTR{power/wakeup}="enabled"
  '';
}
