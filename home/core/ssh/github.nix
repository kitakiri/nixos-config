{
  config,
  pkgs,
  ...
}: {
  programs.ssh.settings."github.com" = {
    User = "git";
    IdentityFile = "~/.ssh/id_ed25519";
  };
}
