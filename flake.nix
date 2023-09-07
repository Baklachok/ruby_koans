{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      with pkgs; {
        devShells.default = mkShell {
          buildInputs = [
            nil
            ruby
            rubyPackages_3_3.rake
            rubyPackages_3_3.solargraph
          ];
        };

        formatter = nixpkgs-fmt;
      });
}
