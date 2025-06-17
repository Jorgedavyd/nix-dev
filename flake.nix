{
    description = "Personal derivations for specific packages";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
        flake-utils.url = "github:numtide/flake-utils";
    };

    outputs = { self, nixpkgs, flake-utils }:
        let
            pythonPackageOverrides = final: prev: {
                mcp = prev.mcp.overridePythonAttrs (old: rec {
                    version = "1.9.4";
                    src = final.fetchFromGitHub {
                        owner = "mcp";
                        repo = "python-sdk";
                        rev = "v${version}";
                        sha256 = final.lib.fakeSha256;
                    };
                    dependencies = old.dependencies ++ [ final.python-multipart ];
                });
                corkit = final.callPackage ./dev/python/corkit.nix { };
                dydantic = final.callPackage ./dev/python/dydantic.nix { };
                langchain-mcp-adapters = final.callPackage ./dev/python/langchain-mcp-adapters.nix { };
                langchain-milvus = final.callPackage ./dev/python/langchain-milvus.nix { };
                langchain-nvidia-ai-endpoints = final.callPackage ./dev/python/langchain-nvidia-ai-endpoints.nix { };
                langgraph-swarm = final.callPackage ./dev/python/langgraph-swarm.nix { };
                langmem = final.callPackage ./dev/python/langmem.nix { };
                lightorch = final.callPackage ./dev/python/lightorch.nix { };
                nemo-guardrails = final.callPackage ./dev/python/nemo-guardrails.nix { };
                nemo-toolkit = final.callPackage ./dev/python/nemo.nix { };
                nvidia-physicsnemo = final.callPackage ./dev/python/physicsnemo.nix { };
                starstream = final.callPackage ./dev/python/starstream.nix { };
                trustcall = final.callPackage ./dev/python/trustcall.nix { };
            };

            overlay = final: prev: {
                sfmono-liga = final.callPackage ./pkgs/fonts/sfmono-liga.nix { };
                blexmono-liga = final.callPackage ./pkgs/fonts/blexmono-liga.nix { };

                python312 = prev.python312.override {
                    packageOverrides = pythonPackageOverrides;
                };

                python312Packages = prev.python312Packages // (pythonPackageOverrides final.python312Packages prev.python312Packages);
            };
        in
            flake-utils.lib.eachDefaultSystem (system:
                let
                    pkgs = import nixpkgs {
                        inherit system;
                        overlays = [ overlay ];
                        config.allowUnfree = true;
                    };
                in {
                    packages = {
                        inherit (pkgs) sfmono-liga blexmono-liga;
                        inherit (pkgs.python312Packages)
                        corkit
                        dydantic
                        langchain-mcp-adapters
                        langchain-milvus
                        langchain-nvidia-ai-endpoints
                        langgraph-swarm
                        langmem
                        lightorch
                        nemo-guardrails
                        nemo-toolkit
                        nvidia-physicsnemo
                        starstream
                        trustcall;
                    };
                }
            ) // {
            overlays.default = overlay;
            overlays.pythonPackages = pythonPackageOverrides;
        };
}
