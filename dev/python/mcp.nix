{
lib,
py-pkgs,
fetchFromGitHub,

## dependencies
anyio,
uvicorn,
httpx,
httpx-sse,
starlette,
python-multipart,
sse-starlette,
pydantic,
pydantic-settings,

## build inputs
wheel,
hatchling,
uv-dynamic-versioning,
}:
py-pkgs.buildPythonPackage rec {
    pname = "mcp";
    version = "v1.9.4";
    pyproject = true;

    src = fetchFromGitHub {
        owner = "modelcontextprotocol";
        repo = "python-sdk";
        rev = version;
        sha256 = "sha256-VXbu/wHbXGS+cISJVUgCVEpTmZc0VfckNRoMj3GDi/A=";
    };

    dependencies = [
        anyio
        uvicorn
        httpx
        httpx-sse
        starlette
        python-multipart
        sse-starlette
        pydantic
        pydantic-settings
    ];

    nativeBuildInputs = [
        wheel
        hatchling
        uv-dynamic-versioning
    ];

    doCheck = false;

    meta = with lib; {
        description = "The Python-sdk for Model Context Protocol";
        homepage = "https://github.com/langchain-ai/langchain-nvidia/tree/main/libs/trt";
        license = licenses.mit;
        maintainers = with maintainers; [ ];
        platforms = platforms.all;
    };
}
