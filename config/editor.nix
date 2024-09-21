# SEE: https://docs.helix-editor.com/configuration.html
{
  theme = "ayu_evolve";
  editor = {
    # Number of inlines of padding around the edge of the screen when scrolling
    scrolloff = 5;

    # Enable mouse mode
    mouse = true;

    # Middle click paste support
    middle-click-paste = true;

    # Number of lines to scroll per scroll wheel step
    scroll-lines = 3;
    # shell = []

    # Line number display: absolute simply shows each line's number, while relative shows the distance from the current line# .
    # When unfocused or in insert mode, relative will still show absolute line numbers
    line-number = "absolute";

    # Highlight all lines with a cursor
    cursorline = true;

    # Highlight all columns with a cursor
    cursorcolumn = false;

    # Gutters to display: Available are diagnostics and diff and line-numbers and spacer, note that diagnostics also includes other features like breakpoints, 1-width padding will be inserted if gutters is non-empty
    gutters = [ "diagnostics" "spacer" "line-numbers" "spacer" "diff" ];

    # Enable automatic pop up of auto-completion
    auto-completion = true;

    # Enable automatic formatting on save
    auto-format = true;

    # Time in milliseconds since last keypress before idle timers trigger.
    idle-timeout = 250;

    # Time in milliseconds after typing a word character before completions are shown, set to 5 for instant.
    completion-timeout = 5;

    # Whether to apply completion item instantly when selected
    preview-completion-insert = true;

    # The min-length of word under cursor to trigger autocompletion
    completion-trigger-len = 2;

    # Set to true to make completions always replace the entire word and not just the part before the cursor
    completion-replace = true;

    # Whether to display info boxes
    auto-info = true;

    # Set to true to override automatic detection of terminal truecolor support in the event of a false negative
    true-color = true;

    # Set to true to override automatic detection of terminal undercurl support in the event of a false negative
    undercurl = false;

    # List of column positions at which to display the rulers.
    # Can be overridden by language specific rulers in languages.toml file
    rulers = [ 120 ];

    # Renders a line at the top of the editor displaying open buffers.
    # Can be always, never or multiple (only shown if more than one buffer is in use)
    bufferline = "always";

    # Whether to color the mode indicator with different colors depending on the mode itself
    color-modes = true;

    # Maximum line length. Used for the :reflow command and soft-wrapping if soft-wrap.wrap-at-text-width is set
    text-width = 80;

    # workspace-lsp-roots = []

    # The line ending to use for new documents.
    # Can be native, lf, crlf, ff, cr or nel. native uses the platform's native line ending (crlf on Windows, otherwise lf).
    default-line-ending = "native";

    # Whether to automatically insert a trailing line-ending on write if missing
    insert-final-newline = true;

    # Draw border around popup, menu, all, or none
    popup-border = "all";

    # How the indentation for a newly inserted line is computed: simple just copies the indentation level from the previous line, tree-sitter computes the indentation based on the syntax tree and hybrid combines both approaches.
    # If the chosen heuristic is not available, a different one will be used as a fallback (the fallback order being hybrid -> tree-sitter -> simple).
    indent-heuristic = "hybrid";

    # The characters that are used to generate two character jump labels.
    # Characters at the start of the alphabet are used first.
    jump-label-alphabet = "abcdefghijklmnopqrstuvwxyz";

    # STATUS LINE SECTION
    statusline = {
      left = [ "mode" "spinner" ];
      center = [ "file-name" ];
      right = [ "diagnostics" "selections" "position" "file-encoding" "file-line-ending" "file-type" ];
      separator = " ";
      mode.normal = "NORMAL";
      mode.insert = "INSERT";
      mode.select = "SELECT";
    };

    # TODO: Add more helix options

    auto-pairs = true;

    cursor-shape = {
      # insert = "bar";
      # normal = "block";
      # select = "underline";
    };
    file-picker.hidden = false;

    indent-guides = {
      character = "╎";
      render = true;
    };
    lsp = {
      auto-signature-help = false;
      display-messages = true;
    };
  };
  keys = {
    select = {
      "A-x" = "extend_to_line_bounds";
      X = [ "extend_line_up" "extend_to_line_bounds" ];
    };
    normal = {
      g.a = "code_action";
      "ret" = [ "move_line_down" "goto_first_nonwhitespace" ];
      D = "delete_char_backward";
      "A-," = "goto_previous_buffer";
      "A-." = "goto_next_buffer";
      "A-w" = ":buffer-close";
      "A-/" = "repeat_last_motion";
      "A-x" = "extend_to_line_bounds";
      X = [ "extend_line_up" "extend_to_line_bounds" ];

      # Quick exit with ZQ and ZQ
      Z = {
        Q = ":quit!";
        Z = ":write-quit!";
      };
    };
  };
}
