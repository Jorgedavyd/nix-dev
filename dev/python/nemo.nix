{ buildPythonPackage, lib, fetchPypi }:

buildPythonPackage rec {
    pname = "nemo-toolkit";
    version = "2.3.1";
    format = "wheel";
    src = fetchPypi {
        inherit pname version format;
        sha256 = lib.fakeSha256; # Replace with actual SHA256
        dist = "py3";
        python = "py3";
    };
}
