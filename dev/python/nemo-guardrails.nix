{
lib,
buildPythonPackage,
fetchFromGitHub,

## build inputs
poetry-core,

## dependencies
aiohttp,
annoy,
fastapi,
fastembed,
httpx,
jinja2,
langchain,
langchain-core,
langchain-community,
lark,
nest-asyncio,
prompt-toolkit,
pydantic,
pyyaml,
rich,
simpleeval,
starlette,
typer,
uvicorn,
watchdog
}:

buildPythonPackage rec {
    pname = "nemoguardrails";
    version = "v0.13.0";
    format = "pyproject";

    src = fetchFromGitHub {
        owner = "NVIDIA";
        repo = "NeMo-Guardrails";
        rev = version;
        sha256 = "sha256-zqlr38EONGOBdMjKGGOyBCUho8RUqv+qytpe84B5P+U=";
    };

    nativeBuildInputs = [
        poetry-core
    ];

    dependencies = [
        aiohttp
        annoy
        fastapi
        fastembed
        httpx
        jinja2
        langchain
        langchain-core
        langchain-community
        lark
        nest-asyncio
        prompt-toolkit
        pydantic
        pyyaml
        rich
        simpleeval
        starlette
        typer
        uvicorn
        watchdog
    ];

    doCheck = false;

    meta = with lib; {
        description = "NeMo Guardrails, an open-source toolkit for adding programmable guardrails to LLM-based conversational systems";
        homepage = "https://github.com/NVIDIA/NeMo-Guardrails";
        license = licenses.asl20;
        maintainers = with maintainers; [ ];
        platforms = platforms.all;
    };
}

