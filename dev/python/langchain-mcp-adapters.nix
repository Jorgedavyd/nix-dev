{
lib,
buildPythonPackage,
fetchFromGitHub,
## dependencies
mcp,
langchain-core,
## build inputs
pdm-backend
}:

buildPythonPackage rec {
    pname = "langchain-mcp-adapters";
    version = "0.1.7";
    pyproject = true;
    format = "pyproject";

    src = fetchFromGitHub {
        owner = "langchain-ai";
        repo = pname;
        rev =  "langchain-mcp-adapters==${version}";
        sha256 = "sha256-s3Jz16ZXqyUk2yzCUbYna3BUynWZvn0MUZGbQePhRwk=";
    };

    dependencies = [
        langchain-core
        mcp
    ];

    nativeBuildInputs = [
        pdm-backend
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
