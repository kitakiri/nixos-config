{ config, pkgs, ... }:

{
  programs.ssh.matchBlocks."vena" = {
    hostname = "147.45.41.124";
    user = "kitakiri";
    port = 2223;
    identityFile = "~/.ssh/id_ed25519";
  };
}
