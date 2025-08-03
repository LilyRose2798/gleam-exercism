import gleam/dict
import gleam/float
import gleam/int
import gleam/list

pub fn lowest_price(books: List(Int)) -> Float {
  let assert [a, b, c, d, e] =
    books
    |> list.fold(
      dict.from_list([#(1, 0), #(2, 0), #(3, 0), #(4, 0), #(5, 0)]),
      fn(counts, book) {
        let assert Ok(num) = counts |> dict.get(book)
        counts |> dict.insert(book, num + 1)
      },
    )
    |> dict.values
    |> list.sort(int.compare)
  do_lowest_price(#(a, b, c, d, e), 0.0)
}

fn do_lowest_price(counts: #(Int, Int, Int, Int, Int), total: Float) -> Float {
  case counts {
    #(0, 0, 0, 0, a) -> total +. int.to_float(a) *. 800.0
    #(0, 0, 0, a, b) ->
      do_lowest_price(#(0, 0, 0, a - 1, b - 1), total +. 2.0 *. 760.0)
    #(0, 0, a, b, c) ->
      do_lowest_price(#(0, 0, a - 1, b - 1, c - 1), total +. 3.0 *. 720.0)
    #(0, a, b, c, d) ->
      do_lowest_price(#(0, a - 1, b - 1, c - 1, d - 1), total +. 4.0 *. 640.0)
    #(a, b, c, d, e) -> {
      let assert [f, g, h, i, j] =
        list.sort([a, b - 1, c - 1, d - 1, e - 1], int.compare)
      float.min(
        do_lowest_price(
          #(a - 1, b - 1, c - 1, d - 1, e - 1),
          total +. 5.0 *. 600.0,
        ),
        do_lowest_price(#(f, g, h, i, j), total +. 4.0 *. 640.0),
      )
    }
  }
}
