{
lib,
fetchFromGitHub,
buildPythonPackage,

## dependencies
langchain-core,
langgraph,

## build inputs
pdm-backend
}:

buildPythonPackage rec {
    pname = "langgraph-swarm-py";
    version = "0.0.11";
    pyproject = true;

    src = fetchFromGitHub {
        owner = "langchain-ai";
        repo = pname;
        rev =  "langgraph-swarm==${version}";
        sha256 = "sha256-iqnBmC4kvypUrKI2D1ud6hnvWe/MX/eyGkxf3phul+4=";
    };

    dependencies = [
        langchain-core
        langgraph
    ];

    nativeBuildInputs = [
        pdm-backend
    ];

    doCheck = false;

    meta = with lib; {
        description = "A Python library for creating swarm-style multi-agent systems using LangGraph.";
        homepage = "https://github.com/langchain-ai/langgraph-swarm-py";
        license = licenses.mit;
        maintainers = with maintainers; [ ];
        platforms = platforms.all;
    };
}
