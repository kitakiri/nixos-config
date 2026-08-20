{ pkgs, ... }: {
  programs.vesktop = {
    enable = true;

    package = pkgs.vesktop.overrideAttrs (oldAttrs: {
      nativeBuildInputs = (oldAttrs.nativeBuildInputs or [ ]) ++ [ pkgs.makeWrapper ];
      postFixup = (oldAttrs.postFixup or "") + ''
        wrapProgram $out/bin/vesktop \
          --add-flags "--ozone-platform=x11"
      '';
    });

    vencord.settings = {
      plugins = {
        FakeNitro = {
          enabled = true;
          enableStreamQualityBypass = true;
          enableEmojiBypass = true;
          enableStickerBypass = true;
        };
      };
      enabledThemes = [ "noctalia.theme.css" ];
    };
  };
}
