{...}: {
  imports = [
    ./filemanager.nix # nautilus + ark
    ./loupe.nix # просмотр изображений gnome
    ./celluloid.nix # видеопроигрыватель gnome (работает над mpv)
    ./elisa.nix # аудиопроигрыватель kde
    ./kate.nix # текстовый редактор kde
  ];
}
