{ stdenv, fetchFromGitHub, python311Packages, lib, version}:

stdenv.mkDerivation {
    pname = "nvidia-physicsnemo";
    inherit version;
    src = fetchFromGitHub {
        owner = "NVIDIA";
        repo = "physicsnemo";
        rev = "v${version}";
        sha256 = "sha256-XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"; # Replace with actual SHA256
    };

    nativeBuildInputs = [ python311Packages.pip ];

    installPhase = ''
    pip install . --target $out/lib/python3.10/site-packages --no-deps
    '';

    meta = with lib; {
        description = "NVIDIA PhysicsNemo for physics-informed ML";
        homepage = "https://github.com/NVIDIA/physicsnemo";
        license = licenses.asl20;
        platforms = [ "x86_64-linux" ];
    };
}
