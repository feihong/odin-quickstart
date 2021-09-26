package main

import "core:os"
import "core:fmt"
import "core:bytes"

BUF_SIZE :: 8

main :: proc () {
  for {
    fmt.print("Enter some text: ")
    aa: [dynamic][]byte = {}
    defer {
      for a in aa do delete(a)
      delete(aa)
    }

    for {
      data := make([]byte, BUF_SIZE)
      bytes_read, err := os.read(os.stdin, data)
      if bytes_read > 0 {
        append(&aa, data[:bytes_read])
      }
      if bytes_read < BUF_SIZE || err != 0 do break
    }

    out := bytes.concatenate(aa[:])
    defer delete(out)
    fmt.println("Echo:", string(out))
  }
}
