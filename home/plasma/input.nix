{
  programs.plasma.configFile = {
    # Keyboard Layouts
    "kxkbrc"."Layout"."DisplayNames" = ",";
    "kxkbrc"."Layout"."LayoutList" = "us,ru";
    "kxkbrc"."Layout"."Options" = "grp:caps_toggle"; # Toggle English/Russian with Caps Lock
    "kxkbrc"."Layout"."ResetOldOptions" = true;
    "kxkbrc"."Layout"."Use" = true;
    "kxkbrc"."Layout"."VariantList" = ",";

    # Locale
    "plasma-localerc"."Formats"."LANG" = "ru_RU.UTF-8";
  };
}
