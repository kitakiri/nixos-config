{...}: {
  imports = [
    ./zed.nix # ide
    ./filemanager.nix # nautilus + ark
    ./papers.nix # pdf ридер gnome
    ./loupe.nix # просмотр изображений gnome
    ./celluloid.nix # видеопроигрыватель gnome (работает над mpv)
    ./elisa.nix # аудиопроигрыватель kde
    ./kate.nix # текстовый редактор kde
  ];
}
