import gleam/bool
import gleam/list
import gleam/result
import gleam/string
import simplifile

fn lines(str: String) -> List(String) {
  use <- bool.guard(when: str == "", return: [])
  case string.ends_with(str, "\n") {
    True -> string.drop_right(from: str, up_to: 1)
    False -> str
  }
  |> string.split(on: "\n")
}

pub fn read_emails(from path: String) -> Result(List(String), Nil) {
  simplifile.read(from: path) |> result.nil_error |> result.map(lines)
}

pub fn create_log_file(at path: String) -> Result(Nil, Nil) {
  simplifile.create_file(at: path) |> result.nil_error
}

pub fn log_sent_email(to path: String, email email: String) -> Result(Nil, Nil) {
  simplifile.append(to: path, contents: email <> "\n") |> result.nil_error
}

pub fn send_newsletter(
  emails_path: String,
  log_path: String,
  send_email: fn(String) -> Result(Nil, Nil),
) -> Result(Nil, Nil) {
  let _ = create_log_file(at: log_path)
  use emails <- result.try(read_emails(from: emails_path))
  list.each(emails, fn(email) {
    use _ <- result.try(send_email(email))
    log_sent_email(to: log_path, email: email)
  })
  Ok(Nil)
}
