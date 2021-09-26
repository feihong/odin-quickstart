package main

import "core:os"
import "core:fmt"
import "core:bytes"

BUF_SIZE :: 16

main :: proc () {
  for {
    fmt.print("Enter some text: ")
    data := make([]byte, BUF_SIZE)
    bytes_read, err := os.read(os.stdin, data)
    defer delete(data)
    fmt.println("Echo:", string(data[:bytes_read]))
  }
}
