{ lib, py-pkgs, gcc }:

py-pkgs.buildPythonPackage rec {
    pname = "nemoguardrails";
    version = "0.14.0";
    format = "pyproject";

    src = py-pkgs.fetchPypi {
        inherit pname version;
        sha256 = "sha256-L40r1OxG1QnWZIJa/c/jlApkuQ2Aqvj3In4y5hWzR9E=";
    };

    nativeBuildInputs = with py-pkgs; [
        gcc
        annoy
        wheel
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

