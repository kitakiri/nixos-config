{
  programs.plasma.configFile = {
    # Spectacle (Screenshots)
    "spectaclerc"."Annotations"."annotationToolType" = 6;
    "spectaclerc"."GuiConfig"."quitAfterSaveCopyExport" = true;
    "spectaclerc"."ImageSave"."translatedScreenshotsFolder" = "Снимки экрана";
    "spectaclerc"."VideoSave"."translatedScreencastsFolder" = "Записи экрана";

    # KRunner
    "krunnerrc"."General"."FreeFloating" = true;

    # Klipper (Clipboard)
    "klipperrc"."General"."IgnoreImages" = false;
    "klipperrc"."General"."MaxClipItems" = 40;

    # Notifications (Silence default notifications popup from being annoying if read)
    "plasmanotifyrc"."Applications/discord"."Seen" = true;
    "plasmanotifyrc"."Applications/firefox"."Seen" = true;
  };
}
