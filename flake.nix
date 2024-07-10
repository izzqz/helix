{
  description = "Helix editor - bleeding edge version with custom configuration";

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

      copyConfig = system: 
        (pkgsFor system).runCommand "helix-config" {} ''
          mkdir -p $out
          cp -r ${./config}/* $out/
        '';

    in {
      packages = forAllSystems (system:
        let 
          pkgs = pkgsFor system;
          helixPackage = helix.packages.${system}.default;
        in {
          default = pkgs.writeShellScriptBin "hx" ''
            exec ${helixPackage}/bin/hx -c ${copyConfig system}/config.toml "$@"
          '';
        }
      );

      apps = forAllSystems (system: {
        default = {
          type = "app";
          program = "${self.packages.${system}.default}/bin/hx";
        };
      });

      devShells = forAllSystems (system:
        let pkgs = pkgsFor system;
        in {
          default = pkgs.mkShell {
            buildInputs = [ self.packages.${system}.default ];
            shellHook = ''
              echo "Helix (bleeding edge) with custom config is available as 'hx'"
            '';
          };
        }
      );
    };
}
