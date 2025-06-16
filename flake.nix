{
    description = "Personal derivations for specific packages";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
        flake-utils.url = "github:numtide/flake-utils";
    };

    outputs = { self, nixpkgs, flake-utils }:
        let
            overlay = final: prev:
                let
                    py-pkgs = final.python312Packages;
                in
                    rec {
                    sfmono-liga = final.callPackage ./pkgs/fonts/sfmono-liga.nix {};
                    blexmono-liga = final.callPackage ./pkgs/fonts/blexmono-liga.nix {};
                    corkit = final.callPackage ./dev/corkit.nix { py-pkgs = py-pkgs; };
                    lightorch = final.callPackage ./dev/lightorch.nix { py-pkgs = py-pkgs; };
                    nemo = final.callPackage ./dev/nemo.nix {py-pkgs = py-pkgs;};
                    physicsnemo = final.callPackage ./dev/physicsnemo.nix {py-pkgs = py-pkgs;};
                    nemo-guardrails = final.callPackage ./dev/nemo-guardrails.nix {py-pkgs = py-pkgs; };
                    starstream = final.callPackage ./dev/starstream.nix {py-pkgs = py-pkgs;};
                    mcp = final.callPackage ./dev/mcp.nix {py-pkgs = py-pkgs;};
                    langchain-mcp-adapters = final.callPackage ./dev/langchain-mcp-adapters.nix {py-pkgs = py-pkgs; mcp = mcp; };
                    langchain-milvus = final.callPackage ./dev/langchain-milvus.nix {py-pkgs = py-pkgs; };
                    langchain-nvidia-ai-endpoints = final.callPackage ./dev/langchain-nvidia-ai-endpoints.nix {py-pkgs = py-pkgs; };
                    langchain-nvidia-trt = final.callPackage ./dev/langchain-nvidia-trt.nix {py-pkgs = py-pkgs; };
                    langgraph-checkpoint = final.callPackage ./dev/langgraph-checkpoint.nix {py-pkgs = py-pkgs; };
                    langgraph-checkpoint-postgres = final.callPackage ./dev/langgraph-checkpoint-postgres.nix {py-pkgs = py-pkgs; };
                    langgraph-swarm = final.callPackage ./dev/langgraph-swarm.nix {py-pkgs = py-pkgs; };
                    dydantic = final.callPackage ./dev/dydantic.nix {py-pkgs = py-pkgs; poetry2nix = poetry2nix; };
                    trustcall = final.callPackage ./dev/trustcall.nix { poetry2nix = poetry2nix; };
                    langmem = final.callPackage ./dev/langmem.nix {py-pkgs = py-pkgs; langgraph-checkpoint = langgraph-checkpoint; trustcall = trustcall; };
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
                        inherit (pkgs)
                        sfmono-liga
                        blexmono-liga
                        corkit
                        lightorch
                        nemo
                        physicsnemo
                        nemo-guardrails
                        starstream
                        langchain-mcp-adapters
                        langchain-milvus
                        langchain-nvidia-ai-endpoints
                        langchain-nvidia-trt
                        langgraph-checkpoint-postgres
                        langgraph-swarm
                        langmem;
                    };
                }
            ) // {
            overlays.default = overlay;
        };
}
