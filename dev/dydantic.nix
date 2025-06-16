{ lib, py-pkgs, fetchFromGitHub }:

py-pkgs.buildPythonPackage rec {
    pname = "dydantic";
    version = "d35508d5d75a1237e7b6bbd4df838a3dad110408";
    format = "pyproject";

    src = fetchFromGitHub {
        owner = "hinthornw";
        repo = pname;
        rev = version;
        sha256 = "sha256-iqnBmC4kvypUrKI2D1ud6hnvWe/MX/eyGkxf3phul+4=";
    };

    dependencies = with py-pkgs; [
        pydantic
    ];

    nativeBuildInputs = with py-pkgs; [
        poetry-core
    ];

    doCheck = false;

    meta = with lib; {
        description = "Dydantic is a Python library for dynamically generating Pydantic models from JSON schemas. It provides a convenient way to create Pydantic models on-the-fly based on the structure defined in a JSON schema.";
        homepage = "https://github.com/hinthornw/dydantic";
        license = licenses.mit;
        maintainers = with maintainers; [ ];
        platforms = platforms.all;
    };
}
