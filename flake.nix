{
  description = "Helix editor with custom configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    helix = {
      url = "github:helix-editor/helix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, helix, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ ];
        };
        helixPackage = helix.packages.${system}.default;
        helixDeps = import ./dependencies.nix { inherit pkgs; };
        languagesConfig = import ./config/languages.nix { inherit pkgs; };
        editorConfig = import ./config/editor.nix;
        tomlFormat = pkgs.formats.toml { };
        languagesToml = tomlFormat.generate "languages.toml" languagesConfig;
        configToml = tomlFormat.generate "config.toml" editorConfig;
      in
      {
        packages.default = pkgs.symlinkJoin {
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

        apps.default = {
          type = "app";
          program = "${self.packages.${system}.default}/bin/hx";
        };
      }
    );
}
