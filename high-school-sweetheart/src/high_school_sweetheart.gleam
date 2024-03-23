import gleam/string
import gleam/result
import gleam/list
import gleam/string_builder

pub fn first_letter(name: String) -> String {
  name
  |> string.trim
  |> string.first
  |> result.unwrap("")
}

pub fn initial(name: String) -> String {
  name
  |> first_letter
  |> string.uppercase
  |> string.append(".")
}

pub fn initials(full_name: String) -> String {
  full_name
  |> string.split(" ")
  |> list.map(initial)
  |> string.join(" ")
}

pub fn pair(full_name1: String, full_name2: String) -> String {
  string_builder.from_string("\n")
  |> string_builder.append("     ******       ******\n")
  |> string_builder.append("   **      **   **      **\n")
  |> string_builder.append(" **         ** **         **\n")
  |> string_builder.append("**            *            **\n")
  |> string_builder.append("**                         **\n")
  |> string_builder.append("**     ")
  |> string_builder.append(initials(full_name1))
  |> string_builder.append("  +  ")
  |> string_builder.append(initials(full_name2))
  |> string_builder.append("     **\n")
  |> string_builder.append(" **                       **\n")
  |> string_builder.append("   **                   **\n")
  |> string_builder.append("     **               **\n")
  |> string_builder.append("       **           **\n")
  |> string_builder.append("         **       **\n")
  |> string_builder.append("           **   **\n")
  |> string_builder.append("             ***\n")
  |> string_builder.append("              *\n")
  |> string_builder.to_string
}
