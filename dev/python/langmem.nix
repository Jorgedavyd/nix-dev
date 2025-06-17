{
buildPythonPackage,
lib,
fetchFromGitHub,

## dependencies
langgraph-checkpoint,
trustcall,
langchain,
langgraph,
langchain-core,
langchain-openai,
langchain-anthropic,
langsmith,

## build inputs
hatchling
}:

buildPythonPackage rec {
    pname = "langmem";
    version = "0.0.27";
    format = "pyproject";

    src = fetchFromGitHub {
        owner = "langchain-ai";
        repo = pname;
        rev = "7f0b33f85b03fd5bfe2cce838d5606583742bddb";
        sha256 = "sha256-gn4XGn2iuYxHeERbBpE5Rf/6eGdEJAGFXku2WRYX3I0=";
    };

    dependencies = [
        langchain
        langgraph
        langchain-core
        langchain-openai
        langchain-anthropic
        langsmith
        langgraph-checkpoint
        trustcall
    ];

    nativeBuildInputs = [
        hatchling
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
