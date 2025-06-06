{ lib, py-pkgs, fetchFromGitHub }:

py-pkgs.buildPythonPackage rec {
    pname = "chainlit";
    version = "2.5.5";
    format = "pyproject";

    src = fetchFromGitHub {
        owner = "Chainlit";
        repo = pname;
        rev = version;
        sha256 = "11g235cyisnhami5ldjzi66l9za1z7ssjk3j8jz2iivi97gax9h7";
    };

    nativeBuildInputs = with py-pkgs; [
        poetry
        wheel
    ];

    doCheck = false;

    meta = with lib; {
        description = "Build Conversational AI in minutes ⚡️";
        homepage = "https://github.com/Chainlit/chainlit";
        license = licenses.asl20;
        maintainers = with maintainers; [ ];
        platforms = platforms.all;
    };
}

