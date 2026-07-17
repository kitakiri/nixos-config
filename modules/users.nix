{ pkgs, ... }:

{

  users.users.kitakiri = {

    isNormalUser = true;

    description = "kitakiri";

    extraGroups = [

      "networkmanager"

      "wheel"

    ];

  };

}
