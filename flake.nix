{
  description = "Helix editor izzqz configuration";
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
          helixDeps = import ./dependencies.nix { inherit pkgs; };
        in {
          default = pkgs.symlinkJoin {
            name = "helix-with-deps";
            paths = [ helixPackage ] ++ helixDeps;
            buildInputs = [ pkgs.makeWrapper ];
            postBuild = ''
              wrapProgram $out/bin/hx \
                --set HELIX_RUNTIME "${helixPackage}/share/helix/runtime" \
                --add-flags "-c ${copyConfig system}/config.toml" \
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
