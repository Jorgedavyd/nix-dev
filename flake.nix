{
    description = "Personal derivations for specific packages";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    };

    outputs = { self, nixpkgs, ... }:
        let
            overlays = (final: prev: {
                python312 = prev.python312.override {
                    packageOverrides = pyself: pysuper: {
                        mcp = pysuper.mcp.overridePythonAttrs (old: rec {
                            version = "1.9.4";
                            src = prev.fetchFromGitHub {
                                owner = "mcp";
                                repo = "python-sdk";
                                rev = "v${version}";
                                sha256 = "sha256-s3Jz16ZXqyUk2yzCUbYna3BUynWZvn0MUZGbQePhRwk=";
                            };
                            dependencies = (old.dependencies or []) ++ [ pyself.python-multipart ];
                        });

                        corkit = pyself.callPackage ./dev/python/corkit.nix { };
                        dydantic = pyself.callPackage ./dev/python/dydantic.nix { };
                        langchain-mcp-adapters = pyself.callPackage ./dev/python/langchain-mcp-adapters.nix { };
                        langchain-milvus = pyself.callPackage ./dev/python/langchain-milvus.nix { };
                        langchain-nvidia-ai-endpoints = pyself.callPackage ./dev/python/langchain-nvidia-ai-endpoints.nix { };
                        langgraph-swarm = pyself.callPackage ./dev/python/langgraph-swarm.nix { };
                        langmem = pyself.callPackage ./dev/python/langmem.nix { };
                        lightorch = pyself.callPackage ./dev/python/lightorch.nix { };
                        nemo-guardrails = pyself.callPackage ./dev/python/nemo-guardrails.nix { };
                        nemo-toolkit = pyself.callPackage ./dev/python/nemo.nix { };
                        nvidia-physicsnemo = pyself.callPackage ./dev/python/physicsnemo.nix { };
                        starstream = pyself.callPackage ./dev/python/starstream.nix { };
                        trustcall = pyself.callPackage ./dev/python/trustcall.nix { };
                    };
                };

                sfmono-liga = prev.callPackage ./pkgs/fonts/sfmono-liga.nix { };
                blexmono-liga = prev.callPackage ./pkgs/fonts/blexmono-liga.nix { };
            });
        in {
            overlays.default = overlays;
        };
}

