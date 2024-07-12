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
    in
    {
      packages = forAllSystems (system:
        let
          pkgs = pkgsFor system;
          helixPackage = helix.packages.${system}.default;
          helixDeps = import ./dependencies.nix { inherit pkgs; };
          languagesConfig = import ./config/languages.nix { inherit pkgs; };
          editorConfig = import ./config/editor.nix;
          tomlFormat = pkgs.formats.toml { };
          languagesToml = tomlFormat.generate "languages.toml" languagesConfig;
          configToml = tomlFormat.generate "config.toml" editorConfig;
        in
        {
          default = pkgs.symlinkJoin {
            name = "helix-wrapped";
            paths = [ helixPackage ] ++ helixDeps;
            buildInputs = [ pkgs.makeWrapper ];
            postBuild = ''
              mkdir -p $out/config/helix
              cp ${configToml} $out/config/helix/config.toml
              cp ${languagesToml} $out/config/helix/languages.toml
              wrapProgram $out/bin/hx \
                --set XDG_CONFIG_HOME "$out/config" \
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
