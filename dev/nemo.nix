{ py-pkgs, lib }:

python312Packages.buildPythonPackage rec {
    pname = "nemo-toolkit";
    version = "2.3.1";
    format = "wheel";
    src = python312Packages.fetchPypi {
        inherit pname version format;
        sha256 = lib.fakeSha256; # Replace with actual SHA256
        dist = "python";
        python = "py3";
    };
}
