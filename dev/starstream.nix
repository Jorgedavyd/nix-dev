{ lib, py-pkgs, fetchFromGitHub }:

py-pkgs.buildPythonPackage rec {
    pname = "starstream";
    version = "1.1.3";
    src = fetchFromGitHub {
        owner = "jorgedavyd";
        repo = pname;
        rev = version;
        sha256 = "11p2pnr6q3w3zvi96agssy7rsyqcz8cr2jz1bbmmjcg22d6qbjf3";
    };
    format = "setuptools";
    meta = {
        description = "Open source coronagraph data downloader and calibrator";
        license = lib.licenses.mit;
    };
}
