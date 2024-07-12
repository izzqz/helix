{
  description = "Helix editor with custom configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    helix = {
      url = "github:helix-editor/helix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, helix }: 
    let
      supportedSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
      pkgsFor = system: import nixpkgs { 
        inherit system; 
        overlays = [ ];
      };
    in {
      packages = forAllSystems (system:
        let 
          pkgs = pkgsFor system;
          helixPackage = helix.packages.${system}.default;
          helixDeps = import ./dependencies.nix { inherit pkgs; };
        in {
          default = pkgs.symlinkJoin {
            name = "helix-wrapped";
            paths = [ helixPackage ] ++ helixDeps;
            buildInputs = [ pkgs.makeWrapper ];
            postBuild = ''
              wrapProgram $out/bin/hx \
                --add-flags "-c ${./config/config.toml}" \
                --prefix PATH : ${pkgs.lib.makeBinPath helixDeps}
            '';
          };
        }
      );
      apps = forAllSystems (system: {
        default = {
          type = "app";
          program = "${self.packages.${system}.default}/bin/hx";
        };
      });
    };
}
