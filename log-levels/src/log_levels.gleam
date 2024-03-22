import gleam/string

pub fn message(log_line: String) -> String {
  case log_line {
    "[INFO]: " <> m -> m
    "[WARNING]: " <> m -> m
    "[ERROR]: " <> m -> m
    m -> m
  }
  |> string.trim
}

pub fn log_level(log_line: String) -> String {
  case log_line {
    "[INFO]: " <> _ -> "info"
    "[WARNING]: " <> _ -> "warning"
    "[ERROR]: " <> _ -> "error"
    m -> m
  }
}

pub fn reformat(log_line: String) -> String {
  message(log_line) <> " (" <> log_level(log_line) <> ")"
}
