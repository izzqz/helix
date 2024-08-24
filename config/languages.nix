{ pkgs }:

# SEE: https://docs.helix-editor.com/languages.html
{
  language-server = {
    nil = {
      command = "${pkgs.nil}/bin/nil";
    };
    typos = {
      command = "${pkgs.typos-lsp}/bin/typos-lsp";
    };
    godot = {
      command = "${pkgs.netcat-gnu}/bin/nc";
      args = [ "127.0.0.1" "6005" ];
    };
  };

  language = [
    {
      name = "nix";
      auto-format = true;
      language-servers = [ "nil" "typos" ];
      formatter = {
        command = "${pkgs.nixpkgs-fmt}/bin/nixpkgs-fmt";
      };
    }
    {
      name = "gdscript";
      auto-format = true;
      language-servers = [ "godot" "typos" ];
      formatter = {
        command = "${pkgs.gdtoolkit_4}/bin/gdformat";
      };
    }
  ];
}
