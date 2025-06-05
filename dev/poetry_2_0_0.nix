{
lib,
stdenv,
py-pkgs,
fetchFromGitHub,
pythonOlder,
build,
git,
pytest-cov-stub,
pytest-mock,
pytestCheckHook,
setuptools,
tomli-w,
trove-classifiers,
virtualenv,
}:

py-pkgs.buildPythonPackage rec {
    pname = "poetry-core";
    version = "2.0.0";
    pyproject = true;

    disabled = pythonOlder "3.9";

    src = fetchFromGitHub {
        owner = "python-poetry";
        repo = "poetry-core";
        tag = version;
        hash = "sha256-fNj/LI4A4RjjPzYT+0ekwqmm3qzzZL3aACOe8BHviuk=";
    };

    nativeCheckInputs = [
        build
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
