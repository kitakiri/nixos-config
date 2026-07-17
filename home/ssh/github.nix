{ config, pkgs, ... }:

{
  programs.ssh.matchBlocks."github.com" = {
    hostname = "github.com";
    user = "git";
    identityFile = "~/.ssh/github_ed25519";
  };
}
