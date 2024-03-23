import gleam/int
import gleam/list
import gleam/string

const number_sounds = [#(3, "Pling"), #(5, "Plang"), #(7, "Plong")]

pub fn convert(number: Int) -> String {
  case
    list.filter_map(number_sounds, fn(ns) {
      case number % ns.0 {
        0 -> Ok(ns.1)
        _ -> Error(Nil)
      }
    })
  {
    [] -> int.to_string(number)
    s -> string.join(s, "")
  }
}
