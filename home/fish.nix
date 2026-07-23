{...}:

{
  programs.fish = {
    enable = true;

    shellAliases = {
      nrs = "sudo nixos-rebuild switch --flake ~/nixos-config#desktop";
      nfu = "nix flake update ~/nixos-config";
      nfc = "nix flake check ~/nixos-config";
      ncg = "sudo nix-collect-garbage -d";
      nup = "nix flake update ~/nixos-config && sudo nixos-rebuild switch --flake ~/nixos-config#desktop";
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
}
