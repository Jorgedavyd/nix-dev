{ python312Packages, lib }:

python312Packages.buildPythonPackage rec {
    pname = "nemo_guardrails";
    version = "0.14.0";
    format = "wheel";
    src = python312Packages.fetchPypi {
        inherit pname version format;
        sha256 = lib.fakeSha256;
        dist = "python";
        python = "py3";
    };
}
