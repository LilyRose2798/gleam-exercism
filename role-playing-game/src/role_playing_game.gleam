import gleam/option.{type Option, None, Some}
import gleam/int

pub type Player {
  Player(name: Option(String), level: Int, health: Int, mana: Option(Int))
}

pub fn introduce(player: Player) -> String {
  option.unwrap(player.name, "Mighty Magician")
}

pub fn revive(player: Player) -> Option(Player) {
  case player.health {
    0 ->
      Some(
        Player(
          ..player,
          health: 100,
          mana: case player.level >= 10 {
            True -> Some(100)
            False -> None
          },
        ),
      )
    _ -> None
  }
}

pub fn cast_spell(player: Player, cost: Int) -> #(Player, Int) {
  case player.mana {
    Some(mana) if mana >= cost -> #(
      Player(..player, mana: Some(mana - cost)),
      2 * cost,
    )
    Some(_) -> #(player, 0)
    None -> #(Player(..player, health: int.max(0, player.health - cost)), 0)
  }
}
