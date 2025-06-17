{
lib,
fetchFromGitHub,
buildPythonPackage,
langgraph,
jsonpatch,
dydantic
}:

buildPythonPackage rec {
    pname = "trustcall";
    version = "0.0.39";
    format = "pyproject";

    src = fetchFromGitHub {
        owner = "hinthornw";
        repo = pname;
        rev = "d61267d366cd16aa95ebc90d62824e5c40f253bd";
        sha256 = "sha256-iqnBmC4kvypUrKI2D1ud6hnvWe/MX/eyGkxf3phul+4=";
    };

    dependencies = [
        langgraph
        jsonpatch
        dydantic
    ];

    doCheck = false;

    meta = with lib; {
        description = "A python library for reliable JSON parsing within the agentic realm.";
        homepage = "https://github.com/hinthornw/trustcall";
        license = licenses.mit;
        maintainers = with maintainers; [ ];
        platforms = platforms.all;
    };
}
