{ lib, py-pkgs, fetchFromGitHub }:

py-pkgs.buildPythonPackage rec {
    pname = "langchain-nvidia-trt";
    version = "libs/ai-endpoints/v0.3.10";
    format = "pyproject";

    src = fetchFromGitHub {
        owner = "langchain-ai";
        repo = pname;
        rev = version;
        sha256 = "sha256-dGqOXwHfXEQQraav+i/LhbeCKqH2Eg9TWZh8mHDjaxo=";
    };

    sourceRoot = "source/libs/trt";


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
        description = "The langchain-nvidia-trt package contains LangChain integrations for TensorRT and Triton inference server";
        homepage = "https://github.com/langchain-ai/langchain-nvidia/tree/main/libs/trt";
        license = licenses.mit;
        maintainers = with maintainers; [ ];
        platforms = platforms.all;
    };
}


