{ py-pkgs, lib }:

py-pkgs.buildPythonPackage rec {
    pname = "nvidia-physicsnemo";
    version = "1.0.1";
    format = "wheel";
    src = py-pkgs.fetchPypi {
        inherit pname version format;
        sha256 = lib.fakeSha256;
        dist = "python";
        python = "py3";
    };
}
