import argv
import envoy
import fabulab_gleam/internal
import fabulab_gleam/lasagna
import gleam/int
import gleam/io
import gleam/result

pub fn main() {
  case argv.load().arguments {
    ["get", name] -> get(name)
    ["lasagna", layers] -> lasagna(layers)
    _ -> {
      io.println("* Usage to get env: gleam run get <name>")
      io.println(
        "* Usage to run timer for lasagna: gleam run lasagna <layers as number>",
      )
    }
  }
}

fn get(name: String) -> Nil {
  let value = envoy.get(name) |> result.unwrap("")
  io.println(internal.format_pair(name, value))
}

fn lasagna(layers: String) {
  let layer_int = int.parse(layers)
  case layer_int {
    Ok(layer) -> {
      lasagna.make_lasagna(layer)
      io.println("Lasagna is ready!")
    }
    Error(_) -> {
      io.println("Input should be number, but I got: " <> layers)
    }
  }
}
