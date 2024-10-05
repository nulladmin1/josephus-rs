{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, rust-overlay }: 
  let
    system = "x86_64-linux";
    overlays = [(import rust-overlay)];
    pkgs = import nixpkgs {
      inherit overlays system;
    };
  in {
    devShell = pkgs.mkShell {
      CARGO_INSTALL_ROOT = "${toString ./.}/.cargo";
      
      buildInputs = with pkgs; [
        cargo
        rustc
        rust-analyzer
      ];
    };
  };
}
