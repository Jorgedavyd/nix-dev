{
lib,
stdenv,
py-pkgs,
fetchFromGitHub,
git
}:

py-pkgs.buildPythonPackage rec {
    pname = "poetry-core";
    version = "1.9.0";
    pyproject = true;

    src = fetchFromGitHub {
        owner = "python-poetry";
        repo = "poetry-core";
        tag = version;
        hash = "sha256-fNj/LI4A4RjjPzYT+0ekwqmm3qzzZL3aACOe8BHviuk=";
    };

    nativeCheckInputs = with py-pkgs; [
        build
        annoy
        git
        pytest-mock
        pytest-cov-stub
        pytestCheckHook
        setuptools
        tomli-w
        trove-classifiers
        virtualenv
    ];

    disabledTests = false;
    pythonImportsCheck = [ "poetry.core" ];
    pythonNamespaces = [ "poetry" ];

    env.NIX_CFLAGS_COMPILE = lib.optionalString stdenv.cc.isClang "-Wno-int-conversion";

    meta = with lib; {
        changelog = "https://github.com/python-poetry/poetry-core/blob/${src.tag}/CHANGELOG.md";
        description = "Poetry PEP 517 Build Backend";
        homepage = "https://github.com/python-poetry/poetry-core/";
        license = licenses.mit;
        teams = [ teams.python ];
    };
}
