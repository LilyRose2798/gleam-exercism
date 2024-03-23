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
  case days {
    [] -> False
    [0, ..] -> True
    [_, ..xs] -> has_day_without_birds(xs)
  }
}

pub fn total(days: List(Int)) -> Int {
  case days {
    [] -> 0
    [x, ..xs] -> x + total(xs)
  }
}

pub fn busy_days(days: List(Int)) -> Int {
  case days {
    [] -> 0
    [x, ..xs] if x >= 5 -> 1 + busy_days(xs)
    [_, ..xs] -> busy_days(xs)
  }
}
