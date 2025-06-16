{ lib, py-pkgs, fetchFromGitHub }:

py-pkgs.buildPythonPackage rec {
    pname = "trustcall";
    version = "d61267d366cd16aa95ebc90d62824e5c40f253bd";
    format = "pyproject";

    src = fetchFromGitHub {
        owner = "hinthornw";
        repo = pname;
        rev = version;
        sha256 = "sha256-iqnBmC4kvypUrKI2D1ud6hnvWe/MX/eyGkxf3phul+4=";
    };

    dependencies = with py-pkgs; [
        langgraph
        jsonpatch
        dydantic
    ];

    nativeBuildInputs = with py-pkgs; [
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
