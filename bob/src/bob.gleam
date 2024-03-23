import gleam/string
import gleam/bool

pub fn hey(remark: String) -> String {
  let r = string.trim(remark)
  use <- bool.guard(r == "", "Fine. Be that way!")
  let upper = string.uppercase(r)
  let yelling = r == upper && string.lowercase(r) != upper
  let question = string.ends_with(r, "?")
  use <- bool.guard(yelling && question, "Calm down, I know what I'm doing!")
  use <- bool.guard(question, "Sure.")
  use <- bool.guard(yelling, "Whoa, chill out!")
  "Whatever."
}
