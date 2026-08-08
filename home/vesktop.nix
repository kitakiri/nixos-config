{ ... }: {
  programs.vesktop = {
    enable = true;

    vencord.settings = {
      plugins = {
        FakeNitro = {
          enabled = true;
          enableStreamQualityBypass = true;   # снимает лимит на качество/FPS стрима
          # ниже — по желанию, тоже часть FakeNitro
          enableEmojiBypass = true;
          enableStickerBypass = true;
        };
      };
    };
  };
}
