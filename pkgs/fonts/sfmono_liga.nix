{ stdenv, fetchFromGitHub, lib, enableWindowsFonts ? false }:

stdenv.mkDerivation {
    pname = "liga-sfmono";
    version = "unstable-2021-08-02";

    src = fetchFromGitHub {
        owner = "shaunsingh";
        repo = "SFMono-Nerd-Font-Ligaturized";
        rev = "main";
        sha256 = lib.fakeSha256;
    };

    installPhase = ''
  mkdir -p $out/share/fonts/opentype/NerdFonts
  mkdir -p $out/share/fonts/truetype/NerdFonts

  find . -name '*.otf' -exec mv {} $out/share/fonts/opentype/NerdFonts/ \;
  find . -name '*.ttf' -exec mv {} $out/share/fonts/truetype/NerdFonts/ \;

  ${lib.optionalString (!enableWindowsFonts) ''
    rm -rfv $out/share/fonts/opentype/NerdFonts/*Windows\ Compatible.*
    rm -rfv $out/share/fonts/truetype/NerdFonts/*Windows\ Compatible.*
        ''}
    '';

    dontConfigure = true;
    dontBuild = true;

    meta = with lib; {
        description = "San Francisco Mono Nerd Font with Ligatures";
        homepage = "https://github.com/shaunsingh/SFMono-Nerd-Font-Ligaturized";
        license = licenses.unfree;
        platforms = platforms.unix;
    };
}
