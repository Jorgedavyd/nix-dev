{
lib,
fetchFromGitHub,
buildPythonPackage,

## dependencies
langchain-core,
pymilvus,

## build inputs
poetry-core
}:

buildPythonPackage rec {
    pname = "langchain-milvus";
    version = "0.2.0";
    format = "pyproject";

    src = fetchFromGitHub {
        owner = "langchain-ai";
        repo = "langchain-milvus";
        rev = "libs/milvus/v${version}";
        sha256 = "sha256-dGqOXwHfXEQQraav+i/LhbeCKqH2Eg9TWZh8mHDjaxo=";
    };

    sourceRoot = "source/libs/milvus";

    dependencies = [
        langchain-core
        pymilvus
    ];

    nativeBuildInputs = [
        poetry-core
    ];

    doCheck = false;

    meta = with lib; {
        description = "LangChain Milvus provides seamless integration between LangChain, a framework for building applications with large language models (LLMs), and Milvus, a powerful vector database designed for similarity search and AI applications.";
        homepage = "https://github.com/langchain-ai/langchain-milvus/tree/main/libs/milvus";
        license = licenses.mit;
        maintainers = with maintainers; [ ];
        platforms = platforms.all;
    };
}

