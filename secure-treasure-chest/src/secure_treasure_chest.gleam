import gleam/bool
import gleam/string

pub opaque type TreasureChest(a) {
  TreasureChest(password: String, treasure: a)
}

pub fn create(
  password: String,
  contents: treasure,
) -> Result(TreasureChest(treasure), String) {
  use <- bool.guard(
    string.length(password) < 8,
    Error("Password must be at least 8 characters long"),
  )
  Ok(TreasureChest(password, contents))
}

pub fn open(
  chest: TreasureChest(treasure),
  password: String,
) -> Result(treasure, String) {
  use <- bool.guard(chest.password != password, Error("Incorrect password"))
  Ok(chest.treasure)
}
