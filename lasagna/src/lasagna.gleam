pub fn expected_minutes_in_oven() {
  40
}

pub fn remaining_minutes_in_oven(mins: Int) {
  expected_minutes_in_oven() - mins
}

pub fn preparation_time_in_minutes(layers: Int) {
  layers * 2
}

pub fn total_time_in_minutes(layers: Int, mins: Int) {
  preparation_time_in_minutes(layers) + mins
}

pub fn alarm() {
  "Ding!"
}
