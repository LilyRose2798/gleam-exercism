import gleam/list

const numeral_values = [
  #("M", 1000),
  #("CM", 900),
  #("D", 500),
  #("CD", 400),
  #("C", 100),
  #("XC", 90),
  #("L", 50),
  #("XL", 40),
  #("X", 10),
  #("IX", 9),
  #("V", 5),
  #("IV", 4),
  #("I", 1),
]

pub fn convert(number: Int) -> String {
  case list.find(numeral_values, fn(nv) { number >= nv.1 }) {
    Ok(#(numeral, value)) -> numeral <> convert(number - value)
    Error(Nil) -> ""
  }
}
