{ lib, py-pkgs, fetchFromGitHub }:

py-pkgs.buildPythonPackage rec {
    pname = "langchain-mcp-adapters";
    version = "langchain-mcp-adapters==0.1.7";
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
        description = "This library provides a lightweight wrapper that makes Anthropic Model Context Protocol (MCP) tools compatible with LangChain and LangGraph.";
        homepage = "https://github.com/langchain-ai/langchain-mcp-adapters";
        license = licenses.mit;
        maintainers = with maintainers; [ ];
        platforms = platforms.all;
    };
}
