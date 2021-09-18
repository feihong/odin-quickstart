package main

import "core:os"
import "core:fmt"

main :: proc() {
  if f, err := os.open(path = "output.txt", 
                       flags = os.O_WRONLY | os.O_CREATE, 
                       mode = os.S_IRUSR | os.S_IWUSR); err == 0 {
    defer os.close(f)

    for i := 0; i < 8; i += 1 {
      fmt.println("Writing...")
  	  os.write_string(f, "这是什么鬼东西？\n")
    }
  } else {
    fmt.println("Error occurred: ", err)
  }  
}