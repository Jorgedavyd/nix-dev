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
                    sfmono-liga = final.callPackage ./pkgs/fonts/sfmono_liga.nix {};
                    blexmono-liga = final.callPackage ./pkgs/fonts/blexmono_liga.nix {};
                    corkit = final.callPackage ./dev/corkit.nix { py-pkgs = py-pkgs; };
                    poetry-core = final.callPackage ./dev/poetry_2_0_0.nix { py-pkgs = py-pkgs; };
                    lightorch = final.callPackage ./dev/lightorch.nix { py-pkgs = py-pkgs; };
                    nvidia_nemo = final.callPackage ./dev/nemo.nix {py-pkgs = py-pkgs;};
                    nvidia_physicsnemo = final.callPackage ./dev/physicsnemo.nix {py-pkgs = py-pkgs;};
                    nvidia_nemo_guardrails = final.callPackage ./dev/nemo_guardrails.nix {py-pkgs = py-pkgs; poetry-core = poetry-core; };
                    starstream = final.callPackage ./dev/starstream.nix {py-pkgs = py-pkgs;};
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
                        nvidia_nemo
                        nvidia_nemo_guardrails
                        nvidia_physicsnemo
                        starstream;
                    };
                }
            ) // {
            overlays.default = overlay;
        };
}

