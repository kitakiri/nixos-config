{pkgs, username, hostname, config, ...}: {
  programs.fish = {
    enable = true;

    shellAliases = {
      nrs = "sudo nixos-rebuild switch --flake ~/nixos-config#${hostname}";
      nrb = "sudo nixos-rebuild build --flake ~/nixos-config#${hostname}";
      nrr = "sudo nixos-rebuild --rollback";
      nfu = "nix flake update --flake ~/nixos-config";
      nfc = "nix flake check --flake ~/nixos-config";
      ncg = "sudo nix-collect-garbage -d";
      nup = "nix flake update --flake ~/nixos-config && sudo nixos-rebuild switch --flake ~/nixos-config#${hostname}";
      ngen = "sudo nixos-rebuild list-generations";

      cdconfignixos = "cd ~/nixos-config";

      ll = "ls -lah";
      gs = "git status";
    };

    functions = {
      nixconfget-info = ''
        nixos-option -I nixos-config=${config.home.homeDirectory}/nixos-config/hosts/${hostname}/configuration.nix $argv
      '';

      nixhomget-info = ''
        nix eval --json ~/nixos-config#nixosConfigurations.${hostname}.config.home-manager.users.${username}.$argv
      '';
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
