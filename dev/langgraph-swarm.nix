{ lib, py-pkgs, fetchFromGitHub }:

py-pkgs.buildPythonPackage rec {
    pname = "langgraph-swarm-py";
    version = "langgraph-swarm==0.0.11";
    format = "pyproject";

    src = fetchFromGitHub {
        owner = "langchain-ai";
        repo = pname;
        rev = version;
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
        description = "A Python library for creating swarm-style multi-agent systems using LangGraph.";
        homepage = "https://github.com/langchain-ai/langgraph-swarm-py";
        license = licenses.mit;
        maintainers = with maintainers; [ ];
        platforms = platforms.all;
    };
}


