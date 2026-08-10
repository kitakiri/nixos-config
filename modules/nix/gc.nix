{...}: {
  nix = {
    # 1. Автоматическая оптимизация хранилища
    settings.auto-optimise-store = true;

    # 2. Автоматическая сборка мусора
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
  };

  # 3. Ограничение пунктов в меню загрузчика (чтобы не листать десятки старых поколений при старте)
  # boot.loader.systemd-boot.configurationLimit = 20;
  # Если используете GRUB, замените systemd-boot на grub
}
