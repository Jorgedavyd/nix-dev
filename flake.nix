{
    description = "Personal derivations for specific packages";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        flake-utils.url = "github:numtide/flake-utils";
    };

    outputs = { self, nixpkgs, flake-utils }:
        flake-utils.lib.eachDefaultSystem (system:
            let
                pkgs = nixpkgs.legacyPackages.${system};
                customPackages = {
                    sfmono-liga = pkgs.callPackage ./pkgs/fonts/sfmono_liga.nix {};
                    blexmono-liga = pkgs.callPackage ./pkgs/fonts/blexmono_liga.nix {};
                    corkit = pkgs.callPackage ./dev/corkit.nix {};
                    lightorch = pkgs.callPackage ./dev/lightorch.nix {};
                    nvidia_nemo = pkgs.callPackage ./dev/nemo.nix {};
                    nvidia_physicsnemo = pkgs.callPackage ./dev/physicsnemo.nix {};
                    starstream = pkgs.callPackage ./dev/starstream.nix {};
                };
            in
                {
                packages = customPackages;
                overlays.default = final: prev: customPackages;
            }
        ) // {
            overlay = self.overlays.default;
        };
}
