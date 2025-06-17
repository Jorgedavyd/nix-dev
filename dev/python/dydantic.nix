{
lib,
fetchFromGitHub,
buildPythonPackage,

## dependencies
pydantic,
email-validator,

## build inputs
poetry-core,
pdm-backend
}:
buildPythonPackage rec {
    pname = "dydantic";
    version = "0.0.8";
    format = "pyproject";

    src = fetchFromGitHub {
        owner = "hinthornw";
        repo = pname;
        rev = "d35508d5d75a1237e7b6bbd4df838a3dad110408";
        sha256 = "sha256-iqnBmC4kvypUrKI2D1ud6hnvWe/MX/eyGkxf3phul+4=";
    };

    propagatedBuildInputs = [
        pydantic
        email-validator
    ];

    nativeBuildInputs = [
        poetry-core
        pdm-backend
    ];

    doCheck = false;

    meta = with lib; {
        description = "Generate Pydantic models from JSON schemas dynamically.";
        homepage = "https://github.com/hinthornw/dydantic";
        license = licenses.mit;
        maintainers = [];
        platforms = platforms.all;
    };
}

