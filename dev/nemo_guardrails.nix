{ lib, py-pkgs, gcc }:

py-pkgs.buildPythonPackage rec {
  pname = "nemo-guardrails";
  version = "0.14.0";
  format = "pyproject";

  src = py-pkgs.fetchFromGitHub {
    owner = "NVIDIA";
    repo = "NeMo-Guardrails";
    rev = "v${version}";
    hash = "sha256-HcQz7YJZwZ3w8z0nq5xJ7z5q5z5q5z5q5z5q5z5q5z5=";
  };

  nativeBuildInputs = [
    gcc
    py-pkgs.setuptools
  ];

  propagatedBuildInputs = with py-pkgs; [
    langchain
    pydantic
    requests
    aiohttp
    click
    typing-extensions
    pyyaml
    annoy
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
