# SEE: https://docs.helix-editor.com/configuration.html
{
  theme = "monokai_pro_spectrum";
  editor = {
    bufferline = "multiple";
    line-number = "relative";
    scroll-lines = 1;
    auto-pairs = true;
    rulers = [120];
    true-color = true;
    cursor-shape = {
      insert = "bar";
      normal = "block";
      select = "underline";
    };
    file-picker.hidden = true;
    indent-guides = {
      character = "╎";
      render = true;
    };
    lsp = {
      auto-signature-help = false;
      display-messages = true;
    };
    statusline.left = ["mode" "spinner" "version-control" "file-name"];
  };
  keys = {
    select = {
      "A-x" = "extend_to_line_bounds";
      X = ["extend_line_up" "extend_to_line_bounds"];
    };
    normal = {
      g.a = "code_action";
      "ret" = ["move_line_down" "goto_first_nonwhitespace"];
      D = "delete_char_backward";
      "A-," = "goto_previous_buffer";
      "A-." = "goto_next_buffer";
      "A-w" = ":buffer-close";
      "A-/" = "repeat_last_motion";
      "A-x" = "extend_to_line_bounds";
      X = ["extend_line_up" "extend_to_line_bounds"];
    };
  };
}
