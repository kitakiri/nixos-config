{...}:

{
  programs.fish = {
    enable = true;

    shellAliases = {
      nrs = "sudo nixos-rebuild switch --flake ~/nixos-config#desktop";
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
