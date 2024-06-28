import gleam/erlang/process
import gleam/int
import gleam/io

pub fn expected_minutes_in_oven() -> Int {
  40
}

pub fn remaining_minutes_in_oven(minutes_in_oven: Int) -> Int {
  expected_minutes_in_oven() - minutes_in_oven
}

pub fn preparation_time_in_minutes(layers: Int) -> Int {
  layers * 2
}

pub fn total_time_in_minutes(layers: Int, minutes_in_oven: Int) -> Int {
  preparation_time_in_minutes(layers) + minutes_in_oven
}

pub fn alarm() -> String {
  "Ding!"
}

pub fn make_lasagna(layers: Int) {
  io.println(
    "# Hi, you are making " <> int.to_string(layers) <> " layers of lasagna!",
  )

  let preparation_time_in_minutes = preparation_time_in_minutes(layers)
  let expected = expected_minutes_in_oven()

  io.println("#          Prep time: " <> int.to_string(preparation_time_in_minutes))
  io.println("#    Total oven time: " <> int.to_string(expected))
  io.println("# Total cooking time: " <> int.to_string(total_time_in_minutes(layers, expected)))
  io.println("# Now starting the oven.")
  time_runs(expected)
}

pub fn time_runs(x: Int) -> Int {
  case x {
    0 -> {
      io.println(alarm())
      0
    }
    _ -> {
      //second instead
      process.sleep(10)
      print_every_5(x)
      time_runs(x - 1)
    }
  }
}

fn print_every_5(x: Int) -> Nil {
  case x % 5 {
    0 -> io.println("# " <> int.to_string(x) <> " minutes remaining")
    _ -> Nil
  }
}
