{ stdenv, fetchurl }:
stdenv.mkDerivation {
    pname = "jdt-language-server";
    version = "1.9.0";
    src = fetchurl {
        url = "https://www.eclipse.org/downloads/download.php?file=/jdtls/milestones/1.9.0/jdt-language-server-1.9.0-202203031534.tar.gz";
        sha256 = "sha256-uK8ZJcs7gX/RBh4ApF/7xqynaBnYsvWTliYAnr9DL8c=";
    };
    unpackPhase = ''
        tar -xf $src
    '';

    dontConfigure = true;
    dontPatch = true;

    meta = {
        description = "Java Development Tools";
        license = stdenv.license.epl1;
    };
}
