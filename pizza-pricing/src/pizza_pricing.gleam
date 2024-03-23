pub type Pizza {
  Margherita
  Caprese
  Formaggio
  ExtraSauce(Pizza)
  ExtraToppings(Pizza)
}

pub fn pizza_price(pizza: Pizza) -> Int {
  pizza_price_rec(pizza, 0)
}

fn pizza_price_rec(pizza: Pizza, total: Int) -> Int {
  let plus = fn(x) { x + total }
  case pizza {
    Margherita -> plus(7)
    Caprese -> plus(9)
    Formaggio -> plus(10)
    ExtraSauce(p) -> pizza_price_rec(p, plus(1))
    ExtraToppings(p) -> pizza_price_rec(p, plus(2))
  }
}

pub fn order_price(order: List(Pizza)) -> Int {
  order_price_rec(order, 0, 0)
}

fn order_price_rec(order: List(Pizza), seen: Int, total: Int) -> Int {
  let plus = fn(x) { x + total }
  case order {
    [] if seen == 1 -> plus(3)
    [] if seen == 2 -> plus(2)
    [] -> plus(0)
    [x, ..xs] -> order_price_rec(xs, seen + 1, plus(pizza_price(x)))
  }
}
