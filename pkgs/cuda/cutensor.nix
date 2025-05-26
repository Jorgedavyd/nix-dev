{ stdenv, fetchurl }:
stdenv.mkDerivation {
    pname = "libcutensor";
    version = "2.2.0";
    src = fetchurl {
        url = "https://developer.download.nvidia.com/compute/cutensor/redist/libcutensor/linux-x86_64/libcutensor-linux-x86_64-2.2.0.0-archive.tar.xz";
        sha256 = "";
    };
    unpackPhase = ''
        unzip $out
    '';
    buildPhase = ''
    '';

    installPhase = ''
    '';

    dontConfigure = true;
    dontPatch = true;

    meta = {
        description = "Cuda Tensor Operations";
        license = stdenv.license.eula;
    };
}
