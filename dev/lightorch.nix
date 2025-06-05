{ lib, py-pkgs, fetchFromGitHub }:

py-pkgs.buildPythonPackage rec {
    pname = "lightorch";
    version = "0.0.6";
    src = fetchFromGitHub {
        owner = "jorgedavyd";
        repo = pname;
        rev = version;
        sha256 = "1d98n06n9y3hra4v70jm76l31md9rcvb4m7w768v4gzhf6920wxy";
    };
    format = "setuptools";
    meta = {
        description = "Open source coronagraph data downloader and calibrator";
        license = lib.licenses.mit;
    };
}
