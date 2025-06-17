{
lib,
buildPythonPackage,
fetchFromGitHub,

## build inputs
setuptools,

## dependencies
certifi,
fsspec,
numpy,
onnx,
packaging,
s3fs,
timm,
torch,
tqdm,
treelib,
xarray,
zarr,
}:

buildPythonPackage rec {
    pname = "nvidia-physicsnemo";
    version = "1.1.1";
    format = "wheel";
    src = fetchFromGitHub {
        owner = "NVIDIA";
        repo = pname;
        rev = "v${version}";
        sha256 = lib.fakeSha256;
    };
    nativeBuildInputs = [
        setuptools
    ];
    dependencies = [
        certifi
        fsspec
        numpy
        onnx
        packaging
        s3fs
        setuptools
        timm
        torch
        tqdm
        treelib
        xarray
        zarr
    ];
}
