{
  programs.plasma.configFile = {
    # Virtual Desktops
    "kwinrc"."Desktops"."Id_1" = "5757ac2c-6cb3-411c-a214-10689de94953";
    "kwinrc"."Desktops"."Id_2" = "d8eb9fe8-ece7-4021-a337-3e070ebfb59a";
    "kwinrc"."Desktops"."Number" = 2;
    "kwinrc"."Desktops"."Rows" = 1;

    # Blur Effects
    "kwinrc"."Effect-blur"."BlurStrength" = 10;
    "kwinrc"."Effect-blur"."NoiseStrength" = 3;
    "kwinrc"."Effect-blur"."Saturation" = 201;

    # KWin Mouse & Window Snap
    "kwinrc"."MouseBindings"."CommandAll1" = "Activate, raise and move";
    "kwinrc"."Windows"."FocusStealingPreventionLevel" = 0;
    "kwinrc"."Windows"."WindowSnapZone" = 1;
    "kwinrc"."Xwayland"."Scale" = 1;

    # Window Decorations
    "kwinrc"."org.kde.kdecoration2"."ButtonsOnLeft" = "XIA";
    "kwinrc"."org.kde.kdecoration2"."ButtonsOnRight" = "";

    # Task Switcher (TabBox)
    "kwinrc"."TabBox"."ActivitiesMode" = 0;
    "kwinrc"."TabBox"."HighlightWindows" = false;
    "kwinrc"."TabBox"."LayoutName" = "big_icons";

    # KWin Plugins
    "kwinrc"."Plugins"."magiclampEnabled" = true;
    "kwinrc"."Plugins"."squashEnabled" = false;

    # Window Rules
    kwinrulesrc = {
      General = {
        #count = 1;
        rules = "69c13473-c249-4824-8763-1dc9628bd956";
      };

      # А само правило описывается как отдельный (соседний) блок на том же уровне
      "69c13473-c249-4824-8763-1dc9628bd956" = {
        Description = "Скрыть телегу из демки";
        Enabled = true;
        excludefromcapture = true;
        excludefromcapturerule = 3;
        wmclass = "org.telegram.desktop";
        wmclassmatch = 1;
      };
    };
  };
}
