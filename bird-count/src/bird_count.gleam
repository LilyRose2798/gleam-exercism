import gleam/list
import gleam/int

pub fn today(days: List(Int)) -> Int {
  case days {
    [x, ..] -> x
    _ -> 0
  }
}

pub fn increment_day_count(days: List(Int)) -> List(Int) {
  case days {
    [x, ..xs] -> [x + 1, ..xs]
    _ -> [1]
  }
}

pub fn has_day_without_birds(days: List(Int)) -> Bool {
  list.any(days, fn(x) { x == 0 })
}

pub fn total(days: List(Int)) -> Int {
  int.sum(days)
}

pub fn busy_days(days: List(Int)) -> Int {
  days
  |> list.filter(fn(x) { x >= 5 })
  |> list.length
}
