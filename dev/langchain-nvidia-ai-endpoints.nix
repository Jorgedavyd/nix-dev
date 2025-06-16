{ lib, py-pkgs, fetchFromGitHub }:

py-pkgs.buildPythonPackage rec {
    pname = "langchain-nvidia-ai-endpoints";
    version = "libs/ai-endpoints/v0.3.10";
    format = "pyproject";

    src = fetchFromGitHub {
        owner = "langchain-ai";
        repo = "langchain-nvidia";
        rev = version;
        sha256 = "sha256-WDdvdO9T7gbGeeSSSy8muu8zOT3FE6Z9VZwZgS2fK2I=";
    };

    sourceRoot = "source/libs/ai-endpoints";

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
        description = "The langchain-nvidia-ai-endpoints package contains LangChain integrations for chat models and embeddings powered by NVIDIA AI Foundation Models, and hosted on NVIDIA API Catalog.";
        homepage = "https://github.com/langchain-ai/langchain-nvidia/tree/main/libs/ai-endpoints";
        license = licenses.mit;
        maintainers = with maintainers; [ ];
        platforms = platforms.all;
    };
}

