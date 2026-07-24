{
  programs.plasma.configFile = {
    # Fonts
    "kdeglobals"."General"."fixed" = "JetBrainsMono Nerd Font,12,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,,0,0";
    "kdeglobals"."General"."font" = "Inter,12,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,,0,0";
    "kdeglobals"."General"."menuFont" = "Inter,12,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,,0,0";
    "kdeglobals"."General"."smallestReadableFont" = "Inter,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,,0,0";
    "kdeglobals"."General"."toolBarFont" = "Inter,12,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,,0,0";
    "kdeglobals"."WM"."activeFont" = "Inter,12,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,,0,0";

    # Font Rendering / Antialiasing
    "kdeglobals"."General"."XftAntialias" = true;
    "kdeglobals"."General"."XftHintStyle" = "hintslight";
    "kdeglobals"."General"."XftSubPixel" = "rgb";

    # Colors & Theme Look and Feel
    "kdeglobals"."General"."AccentColor" = "235,194,236";
    "kdeglobals"."General"."LastUsedCustomAccentColor" = "235,194,236";
    "kdeglobals"."KDE"."AutomaticLookAndFeel" = true;
    "kdeglobals"."KDE"."AnimationDurationFactor" = 1.5;
    "kdeglobals"."KDE"."contrast" = 4;
    "kdeglobals"."KDE"."frameContrast" = 0.2;

    "kdeglobals"."WM"."activeBackground" = "227,229,231";
    "kdeglobals"."WM"."activeBlend" = "227,229,231";
    "kdeglobals"."WM"."activeForeground" = "35,38,41";
    "kdeglobals"."WM"."inactiveBackground" = "239,240,241";
    "kdeglobals"."WM"."inactiveBlend" = "239,240,241";
    "kdeglobals"."WM"."inactiveForeground" = "112,125,138";

    # Cursor
    "kcminputrc"."Mouse"."cursorSize" = 36;

    # Wallpaper (Desktop & Lockscreen)
    "plasmarc"."Wallpapers"."usersWallpapers" = "/home/kitakiri/nixos-config/assets/wallhaven-8o2lm2_6000x3375.png";
    "kscreenlockerrc"."Greeter/Wallpaper/org.kde.image/General"."Image" = "file:///home/kitakiri/nixos-config/assets/wallhaven-8o2lm2_6000x3375.png";
  };
}
