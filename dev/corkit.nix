{ lib, buildPythonPackage, fetchFromGitHub }:

buildPythonPackage rec {
    pname = "corkit";
    version = "1.0.16";
    src = fetchFromGitHub {
        owner = "jorgedavyd";
        repo = pname;
        rev = version;
        sha256 = "11g235cyisnhami5ldjzi66l9za1z7ssjk3j8jz2iivi97gax9h7";
    };
    format = "setuptools";
    meta = {
        description = "Open source coronagraph data downloader and calibrator";
        license = lib.licenses.mit;
    };
}

