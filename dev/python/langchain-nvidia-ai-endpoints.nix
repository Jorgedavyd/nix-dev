{
lib,
fetchFromGitHub,
buildPythonPackage,
## dependencies
langchain-core,
aiohttp,
filetype,

## build inputs
poetry-core
}:

buildPythonPackage rec {
    pname = "langchain-nvidia-ai-endpoints";
    version = "0.3.10";
    format = "pyproject";

    src = fetchFromGitHub {
        owner = "langchain-ai";
        repo = "langchain-nvidia";
        rev = "libs/ai-endpoints/v${version}";
        sha256 = "sha256-WDdvdO9T7gbGeeSSSy8muu8zOT3FE6Z9VZwZgS2fK2I=";
    };

    sourceRoot = "source/libs/ai-endpoints";

    dependencies = [
        langchain-core
        aiohttp
        filetype
    ];

    nativeBuildInputs = [
        poetry-core
    ];

    doCheck = false;

    meta = with lib; {
        description = "The langchain-nvidia-ai-endpoints package contains LangChain integrations for chat models and embeddings powered by NVIDIA AI Foundation Models, and hosted on NVIDIA API Catalog.";
        homepage = "https://github.com/langchain-ai/langchain-nvidia/tree/main/libs/ai-endpoints";
        license = licenses.mit;
        maintainers = with maintainers; [ ];
        platforms = platforms.all;
    };
}

