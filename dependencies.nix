{ pkgs }:
with pkgs; [
  /* LLVM Debugger */
  lldb_18

  /* JSON */
  nodePackages.vscode-json-languageserver

  /* YAML */
  yaml-language-server

  /* TOML */
  taplo

  /* XML */
  # TODO vscode-xml-language-server

  /* Markdown */
  marksman

  /* HTML, CSS, JS, TS */
  vscode-langservers-extracted
  nodePackages.typescript-language-server
  emmet-ls

  /* Zig */
  zls
  zig
]
