{ lib, py-pkgs, fetchFromGitHub }:

py-pkgs.buildPythonPackage rec {
    pname = "langmem";
    version = "0.0.27";
    format = "pyproject";

    src = fetchFromGitHub {
        owner = "langchain-ai";
        repo = pname;
        rev = "7f0b33f85b03fd5bfe2cce838d5606583742bddb";
        sha256 = "sha256-dGqOXwHfXEQQraav+i/LhbeCKqH2Eg9TWZh8mHDjaxo=";
    };

    dependencies = with py-pkgs; [
        langchain-core
        pymilvus
    ];

    nativeBuildInputs = with py-pkgs; [
        poetry-core
        wheel
    ];

    doCheck = false;

    meta = with lib; {
        description ="Prebuilt utilities for memory management and retrieval.";
        homepage = "https://github.com/langchain-ai/langmem";
        license = licenses.mit;
        maintainers = with maintainers; [ ];
        platforms = platforms.all;
    };
}


