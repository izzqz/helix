{ pkgs }:

with pkgs; [
  /* Nix */
  nil

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

  /* Dockerfile */
  # dockerfile-language-server-nodejs

  /* Terraform */
  # terraform-ls

  /* Markdown */
  marksman

  /* HTML, CSS, JS, TS */
  vscode-langservers-extracted
  nodePackages.typescript-language-server
  emmet-ls

  /* Python */
  # python3Packages.python-lsp-server

  /* Rust */
  # rust-analyzer

  /* Go */
  # gopls
  # golangci-lint

  /* C/C++ */
  # clang-tools

  /* Java */
  # jdt-language-server

  /* Lua */
  # lua-language-server

  /* Ruby */
  # solargraph

  /* PHP */
  # phpactor

  /* C# */
  # omnisharp-roslyn

  /* Kotlin */
  # kotlin-language-server

  /* Scala */
  # metals

  /* Haskell */
  # haskell-language-server

  /* Elixir */
  # elixir-ls

  /* OCaml */
  # ocamlPackages.ocaml-lsp

  /* Swift */
  # sourcekit-lsp

  /* Zig */
  zls
  zig

  /* Julia */
  # emacsPackages.lsp-julia

  /* Dart */
  # dart

  /* Elm */
  # elmPackages.elm-language-server

  /* Erlang */
  # erlang-ls

  /* Clojure */
  # clojure-lsp

  /* Crystal */
  # crystalline

  /* D */
  # serve-d

  /* F# */
  # fsautocomplete

  /* LaTeX */
  # texlab

  /* Svelte */
  # nodePackages.svelte-language-server

  /* Vue */
  # nodePackages.vue-language-server

  /* GraphQL */
  # nodePackages.graphql-language-service-cli

  /* Vala */
  # vala-language-server

  /* Ada */
  # TODO ada_language_server

  /* CMake */
  # cmake-language-server
]
