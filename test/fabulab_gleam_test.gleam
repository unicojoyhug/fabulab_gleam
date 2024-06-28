import fabulab_gleam/calcualtion
import fabulab_gleam/internal
import fabulab_gleam/lasagna
import gleam/int
import gleam/io
import gleeunit
import gleeunit/should

pub fn main() {
  gleeunit.main()
}

// gleeunit test functions end in `_test`
pub fn format_pair_test() {
  internal.format_pair("hello", "world")
  |> should.equal("hello=world")
}

pub fn add_test() {
  calcualtion.add(1, 3)
  |> should.equal(4)
}

pub fn lasagna_test() {
  lasagna.expected_minutes_in_oven()
  |> should.equal(40)
  lasagna.remaining_minutes_in_oven(30)
  |> should.equal(10)
  lasagna.preparation_time_in_minutes(30)
  |> should.equal(60)
  lasagna.total_time_in_minutes(3, 20)
  |> should.equal(26)
  lasagna.alarm()
  |> should.equal("Ding!")
}

pub fn time_runs_test() {
  lasagna.time_runs(3)
  |> should.equal(0)
}

pub fn any_test() {
  let layer_int = int.parse("1")
  case layer_int {
    Ok(layer) -> {
      lasagna.make_lasagna(layer)
      io.println("Lasagna is ready!")
    }
    Error(_) -> {
      io.println("failes to parse layer number")
    }
  }
}
