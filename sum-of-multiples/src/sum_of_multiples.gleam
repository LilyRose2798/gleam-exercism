import gleam/int
import gleam/list
import gleam/set.{type Set}

pub fn sum(factors factors: List(Int), limit limit: Int) -> Int {
  factors
  |> list.map(multiples(_, limit))
  |> list.fold(set.new(), set.union)
  |> set.to_list
  |> int.sum
}

fn multiples(base: Int, limit: Int) -> Set(Int) {
  case base > 0 {
    True -> do_multiples(base, base, limit, set.new())
    False ->
      case base < limit {
        True -> set.new() |> set.insert(base)
        False -> set.new()
      }
  }
}

fn do_multiples(
  multiple: Int,
  base: Int,
  limit: Int,
  multiples: Set(Int),
) -> Set(Int) {
  case multiple < limit {
    True ->
      do_multiples(
        multiple + base,
        base,
        limit,
        multiples |> set.insert(multiple),
      )
    False -> multiples
  }
}
