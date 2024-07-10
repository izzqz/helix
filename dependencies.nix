{ pkgs }:

with pkgs; [
  /* Nix */
  nil

  /* JSON */
  # nodePackages.vscode-json-languageserver

  /* YAML */
  # yaml-language-server

  /* TOML */
  taplo

  /* XML */
  # nodePackages.vscode-xml-languageserver

  /* Dockerfile */
  # docker-language-server-nodejs

  /* Terraform */
  # terraform-ls

  /* Markdown */
  marksman

  /* HTML */
  # nodePackages.vscode-html-languageserver-bin

  /* CSS */
  # nodePackages.vscode-css-languageserver-bin

  /* JavaScript/TypeScript */
  # nodePackages.typescript-language-server
  # nodePackages.vscode-eslint-language-server

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
  # ocaml-lsp

  /* Swift */
  # sourcekit-lsp

  /* Zig */
  zls
  zig

  /* Julia */
  # julia-lsp

  /* Dart */
  # dart

  /* Elm */
  # elm-language-server

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
  # ada_language_server

  /* CMake */
  # cmake-language-server
]
