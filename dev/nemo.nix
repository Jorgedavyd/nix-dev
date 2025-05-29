{ buildPythonPackage, fetchPypi }:

buildPythonPackage rec {
    pname = "nemo-toolkit";
    version = "2.3.1";
    format = "wheel";
    src = fetchPypi {
        inherit pname version format;
        sha256 = "sha256-XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"; # Replace with actual SHA256
    };
}
