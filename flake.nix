{
    description = "Personal derivations for specific packages";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        flake-utils.url = "github:numtide/flake-utils";
    };

    outputs = { self, nixpkgs, flake-utils }:
        let
            overlay = final: prev: {
                sfmono-liga = final.callPackage ./pkgs/fonts/sfmono_liga.nix {};
                blexmono-liga = final.callPackage ./pkgs/fonts/blexmono_liga.nix {};
                corkit = final.callPackage ./dev/corkit.nix {};
                lightorch = final.callPackage ./dev/lightorch.nix {};
                nvidia_nemo = final.callPackage ./dev/nemo.nix {};
                nvidia_physicsnemo = final.callPackage ./dev/physicsnemo.nix {};
                starstream = final.callPackage ./dev/starstream.nix {};
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
                        nvidia_physicsnemo
                        starstream;
                    };
                }
            ) // {
            overlays.default = overlay;
        };
}

