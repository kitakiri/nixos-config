{
  config,
  pkgs,
  ...
}: {
  programs.ssh.settings."vena" = {
    HostName = "147.45.41.124";
    User = "kitakiri";
    Port = "2223"; # Значения в settings лучше передавать строками
    IdentityFile = "~/.ssh/id_ed25519";
  };
}
