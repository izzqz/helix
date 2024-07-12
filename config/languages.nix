{ pkgs }:

# SEE: https://docs.helix-editor.com/languages.html
{
  language-server = {
    nil = {
      command = "${pkgs.nil}/bin/nil";
    };
    rust-analyzer = {
      command = "${pkgs.rust-analyzer}/bin/rust-analyzer";
      config.rust-analyzer = {
        cargo.loadOutDirsFromCheck = true;
        checkOnSave.command = "clippy";
        procMacro.enable = true;
        lens = {
          references = true;
          methodReferences = true;
        };
        completion.autoimport.enable = true;
      };
    };
  };

  language = [
    {
      name = "nix";
      auto-format = true;
      language-servers = [ "nil" ];
      formatter = {
        command = "${pkgs.nixpkgs-fmt}/bin/nixpkgs-fmt";
      };
    }
    {
      name = "rust";
      auto-format = true;
      language-servers = [ "rust-analyzer" ];
    }
  ];
}
