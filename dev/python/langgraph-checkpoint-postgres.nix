{
lib,
fetchPypi,
buildPythonPackage
}:

buildPythonPackage rec {
    pname = "langgraph-checkpoint-postgres";
    version = "2.0.21";
    src = fetchPypi {
        inherit pname version;
        sha256 = "sha256-dGqOXwHfXEQQraav+i/LhbeCKqH2Eg9TWZh8mHDjaxo=";
    };
    doCheck = false;

    meta = with lib; {
        description = "The langgraph-checkpoint-postgres package contains Postgres integrations for memory retrieval";
        homepage = "https://pypi.org/project/langgraph-checkpoint-postgres/";
        license = licenses.mit;
        maintainers = with maintainers; [ ];
        platforms = platforms.all;
    };
}

