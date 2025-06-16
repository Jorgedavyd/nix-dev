{ pkgs, poetry2nix }:
let
    inherit (poetry2nix.lib.mkPoetry2Nix { inherit pkgs; }) mkPoetryApplication;
in
    mkPoetryApplication {
        pname = "dydantic";
        version = "0.0.8";

        projectDir = pkgs.fetchFromGitHub {
            owner = "hinthornw";
            repo = "dydantic";
            rev = "d35508d5d75a1237e7b6bbd4df838a3dad110408";
            sha256 = "sha256-iqnBmC4kvypUrKI2D1ud6hnvWe/MX/eyGkxf3phul+4=";
        };

        doCheck = false;

        meta = {
            description = "Dydantic is a Python library for dynamically generating Pydantic models from JSON schemas.";
            homepage = "https://github.com/hinthornw/dydantic";
            license = pkgs.lib.licenses.mit;
        };
    }
