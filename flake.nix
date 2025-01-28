{
  description = "josephus";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    systems.url = "github:nix-systems/default";
  };

  outputs = {
    self,
    nixpkgs,
    systems,
    ...
  }: let
    forEachSystem = nixpkgs.lib.genAttrs (import systems);
    pkgsFor = forEachSystem (system: import nixpkgs {inherit system;});
  in {
    formatter = forEachSystem (system: pkgsFor.${system}.alejandra);

    devShells = forEachSystem (system: {
      default = pkgsFor.${system}.mkShell {
        packages = with pkgsFor.${system}; [
          rustc
          cargo
        ];
      };
    });

    packages = forEachSystem (system: {
      default = pkgsFor.${system}.rustPlatform.buildRustPackage {
        pname = "josephus";
        version = "0.1.0";
        src = ./.;
        cargoHash = "sha256-dJoe/rHDYT6yAMwKZAi4aMGgoAz5JGotke/QL5df/E4=";
      };
    });

    apps = forEachSystem (system: {
      default = {
        type = "app";
        program = "${self.packages.${system}.default}/bin/josephus";
      };
    });
  };
}