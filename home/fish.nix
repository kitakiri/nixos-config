{pkgs, ...}: {
  programs.fish = {
    enable = true;

    shellAliases = {
      nrs = "sudo nixos-rebuild switch --flake ~/nixos-config#desktop";
      nrb = "sudo nixos-rebuild build --flake ~/nixos-config#desktop";
      nrr = "sudo nixos-rebuild --rollback";
      nfu = "nix flake update --flake ~/nixos-config";
      nfc = "nix flake check --flake ~/nixos-config";
      ncg = "sudo nix-collect-garbage -d";
      nup = "nix flake update --flake ~/nixos-config && sudo nixos-rebuild switch --flake ~/nixos-config#desktop";
      ngen = "sudo nixos-rebuild list-generations";

      cdconfignixos = "cd ~/nixos-config";

      ll = "ls -lah";
      gs = "git status";
    };

    shellAbbrs = {
    };

    interactiveShellInit = ''
      set fish_greeting
    '';
  };

  services.tldr-update = {
    enable = true;
    package = pkgs.tldr;
  };
}
