import gleam/int
import gleam/list

pub fn is_armstrong_number(number: Int) -> Bool {
  let #(digits, num_digits) = digits_loop(number, [], 1)
  number == digits |> list.map(power_loop(_, num_digits, 1)) |> int.sum
}

fn power_loop(base: Int, exp: Int, total: Int) -> Int {
  case exp > 0 {
    True -> power_loop(base, exp - 1, total * base)
    False -> total
  }
}

fn digits_loop(x: Int, digits: List(Int), num_digits: Int) -> #(List(Int), Int) {
  case int.absolute_value(x) < 10 {
    True -> #([x, ..digits], num_digits)
    False -> digits_loop(x / 10, [x % 10, ..digits], num_digits + 1)
  }
}
