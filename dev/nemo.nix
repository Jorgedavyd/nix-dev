{ py-pkgs, lib }:

py-pkgs.buildPythonPackage rec {
    pname = "nemo-toolkit";
    version = "2.3.1";
    format = "wheel";
    src = py-pkgs.fetchPypi {
        inherit pname version format;
        sha256 = lib.fakeSha256; # Replace with actual SHA256
        dist = "python";
        python = "py3";
    };
}
