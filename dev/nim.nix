{ buildPythonPackage, fetchPypi }:

buildPythonPackage rec {
    pname = "nvidia-nim";
    version = "stable";
    format = "wheel";
    src = fetchPypi {
        inherit pname version format;
        sha256 = "sha256-XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"; # Replace with actual SHA256
    };
}
