{ lib, fetchPypi, buildPythonPackage}:

buildPythonPackage rec {
    pname = "langgraph-checkpoint";
    version = "2.0.26";
    src = fetchPypi {
        inherit pname version;
        sha256 = "sha256-dGqOXwHfXEQQraav+i/LhbeCKqH2Eg9TWZh8mHDjaxo=";
    };
    doCheck = false;

    meta = with lib; {
        description = "The langgraph-checkpoint package contains memory retrieval utilities for Agentic LLMs";
        homepage = "https://pypi.org/project/langgraph-checkpoint/";
        license = licenses.mit;
        maintainers = with maintainers; [ ];
        platforms = platforms.all;
    };
}

