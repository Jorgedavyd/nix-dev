{ fetchPypi, buildPythonPackage }:

buildPythonPackage rec {
    pname = "nvidia-physicsnemo";
    version = "1.0.1";
    format = "wheel";
    src = fetchPypi {
        inherit pname version format;
        sha256 = "sha256-XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        dist = "python";
        python = "py3";
    };
}
