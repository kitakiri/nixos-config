{ config, pkgs, ... }:

{
  programs.ssh.matchBlocks."github.com" = {
    hostname = "github.com";
    user = "git";
    identityFile = "~/.ssh/id_ed25519";
  };
}
