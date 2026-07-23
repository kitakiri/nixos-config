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
    "kwinrulesrc"."General"."count" = 1;
    "kwinrulesrc"."General"."rules" = "fc611193-9dbc-41c8-9605-3c37b127a4f4";
    "kwinrulesrc"."fc611193-9dbc-41c8-9605-3c37b127a4f4"."Description" = "Параметры для org.telegram.desktop";
    "kwinrulesrc"."fc611193-9dbc-41c8-9605-3c37b127a4f4"."Enabled" = false;
    "kwinrulesrc"."fc611193-9dbc-41c8-9605-3c37b127a4f4"."wmclass" = "org.telegram.desktop";
    "kwinrulesrc"."fc611193-9dbc-41c8-9605-3c37b127a4f4"."wmclassmatch" = 1;
  };
}
