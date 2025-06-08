{ lib, py-pkgs, fetchFromGithub }:

py-pkgs.buildPythonPackage rec {
    pname = "langchain-milvus";
    version = "v0.2.0";
    format = "pyproject";

    src = fetchFromGithub {
        owner = "langchain-ai";
        repo = "https://github.com/langchain-ai/langchain-milvus.git#libs/milvus";
        rev = "libs/milvus/${version}";
        sha256 = "sha256-L40r1OxG1QnWZIJa/c/jlApkuQ2Aqvj3In4y5hWzR9E=";
    };

    nativeBuildInputs = with py-pkgs; [
        wheel
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

