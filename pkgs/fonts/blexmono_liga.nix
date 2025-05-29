{ stdenv, fetchurl, unzip, lib, enableWindowsFonts ? false }:

stdenv.mkDerivation {
    pname = "BlexMonoLiga";
    version = "0.1.0";

    src = fetchurl {
        url = "https://github.com/tdarshana/Blex-Mono-Liga-Powerline/releases/download/rel-v0.1/ligalex-mono-powerline.zip";
        sha256 = "REPLACE_WITH_REAL_HASH";
    };

    nativeBuildInputs = [ unzip ];
    unpackCmd = "unzip $curSrc";

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
        description = "Plex Mono Font Ligaturized with Powerline support";
        homepage = "https://github.com/tdarshana/Blex-Mono-Liga-Powerline";
        license = licenses.unfree;
        platforms = platforms.all;
    };
}
