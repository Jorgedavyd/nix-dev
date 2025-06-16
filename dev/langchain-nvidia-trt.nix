{ lib, py-pkgs, fetchFromGitHub }:

py-pkgs.buildPythonPackage rec {
    pname = "langchain-nvidia-trt";
    version = "libs/ai-endpoints/v0.3.10";
    format = "pyproject";

    src = fetchFromGitHub {
        owner = "langchain-ai";
        repo = "langchain-nvidia";
        rev = version;
        sha256 = "sha256-WDdvdO9T7gbGeeSSSy8muu8zOT3FE6Z9VZwZgS2fK2I=";
    };

    sourceRoot = "source/libs/trt";

    dependencies = with py-pkgs; [
        tritonclient
        (langchain-core.overridePythonAttrs (_: { version = "0.1.50"; }))
        (protobuf.overridePythonAttrs (_: { version = "3.20.3"; }))
        (types-protobuf.overridePythonAttrs (_: { version = "4.24.0.4"; }))
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
