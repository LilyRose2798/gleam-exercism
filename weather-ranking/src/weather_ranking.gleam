import gleam/order.{type Order}
import gleam/float
import gleam/list

pub type City {
  City(name: String, temperature: Temperature)
}

pub type Temperature {
  Celsius(Float)
  Fahrenheit(Float)
}

const offset = 32.0

const factor = 1.8

pub fn fahrenheit_to_celsius(f: Float) -> Float {
  { f -. offset } /. factor
}

pub fn compare_temperature(left: Temperature, right: Temperature) -> Order {
  case left, right {
    Celsius(l), Celsius(r) -> float.compare(l, r)
    Fahrenheit(l), Fahrenheit(r) -> float.compare(l, r)
    Celsius(l), Fahrenheit(r) -> float.compare(l, fahrenheit_to_celsius(r))
    Fahrenheit(l), Celsius(r) -> float.compare(fahrenheit_to_celsius(l), r)
  }
}

pub fn sort_cities_by_temperature(cities: List(City)) -> List(City) {
  list.sort(cities, fn(c1, c2) {
    compare_temperature(c1.temperature, c2.temperature)
  })
}
