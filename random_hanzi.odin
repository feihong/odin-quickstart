package main

import "core:fmt"
import "core:math/rand"
import "core:unicode/utf8"
import "core:time"
import "core:os"
import "core:strconv"

random_int :: proc(start: i32, end: i32) -> i32 {
  max := end - start + 1
  return rand.int31_max(max) + start
}

random_hanzi :: proc() -> rune {
  return transmute(rune) random_int(0x4e00, 0x9fff)
}

random_hanzi_string :: proc(n : int) -> string {
  runes := make([]rune, n)
  defer delete(runes)

  for i := 0; i < n; i += 1 {
    runes[i] = random_hanzi()
  }

  return utf8.runes_to_string(runes)
}

main :: proc() {
  rand.set_global_seed(transmute(u64) time.now()._nsec)

  arg := ""
  if len(os.args) > 1 do arg = os.args[1]

  n := strconv.parse_int(arg) or_else 8

  for i := 1; i <= n; i += 1 {
    s := random_hanzi_string(i)
    defer delete(s)
    fmt.println(s)
  }
}