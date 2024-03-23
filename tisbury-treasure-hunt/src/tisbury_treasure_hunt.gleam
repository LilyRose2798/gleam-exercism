import gleam/list
import gleam/pair

pub fn place_location_to_treasure_location(
  place_location: #(String, Int),
) -> #(Int, String) {
  pair.swap(place_location)
}

pub fn treasure_location_matches_place_location(
  place_location: #(String, Int),
  treasure_location: #(Int, String),
) -> Bool {
  pair.swap(place_location) == treasure_location
}

pub fn count_place_treasures(
  place: #(String, #(String, Int)),
  treasures: List(#(String, #(Int, String))),
) -> Int {
  treasures
  |> list.filter(fn(t) { pair.swap(place.1) == t.1 })
  |> list.length
}

pub fn special_case_swap_possible(
  found_treasure: #(String, #(Int, String)),
  place: #(String, #(String, Int)),
  desired_treasure: #(String, #(Int, String)),
) -> Bool {
  let #(f, p, d) = #(found_treasure.0, place.0, desired_treasure.0)
  f == "Brass Spyglass"
  && p == "Abandoned Lighthouse"
  || f == "Amethyst Octopus"
  && p == "Stormy Breakwater"
  && { d == "Crystal Crab" || d == "Glass Starfish" }
  || f == "Vintage Pirate Hat"
  && p == "Harbor Managers Office"
  && { d == "Model Ship in Large Bottle" || d == "Antique Glass Fishnet Float" }
}
