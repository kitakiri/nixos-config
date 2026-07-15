{ config, pkgs, ... }:

{
  programs.ssh = {
    enable = true;

    matchBlocks = {
      github = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/github_ed25519";
      };
    };
  };
}
