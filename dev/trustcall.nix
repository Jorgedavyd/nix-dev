{ pkgs, poetry2nix }:
let
    inherit (poetry2nix.lib.mkPoetry2Nix { inherit pkgs; }) mkPoetryApplication;
in
    mkPoetryApplication {
        pname = "trustcall";
        version = "0.0.39";

        projectDir = pkgs.fetchFromGitHub {
            owner = "hinthornw";
            repo = "trustcall";
            rev = "d61267d366cd16aa95ebc90d62824e5c40f253bd";
            sha256 = "sha256-iqnBmC4kvypUrKI2D1ud6hnvWe/MX/eyGkxf3phul+4=";
        };

        doCheck = false;

        meta = {
            description = "LLMs struggle when asked to generate or modify large JSON blobs. trustcall solves this by asking the LLM to generate JSON patch operations. This is a simpler task that can be done iteratively.";
            homepage = "https://github.com/hinthornw/trustcall";
            license = pkgs.lib.licenses.mit;
        };
    }
