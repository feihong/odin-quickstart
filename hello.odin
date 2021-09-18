package main

import "core:fmt"
import "core:strings"

main :: proc() {
  dict := map[string]string{
    "hello" = "你好",
    "world" = "世界",
  }

  sentence := "hello world"
  words := strings.split(sentence, " ")
  words2 := make([dynamic]string, len(words))
  
  for _, i in words {
    words2[i] = dict[words[i]]
  }
  

  fmt.println(strings.join(words2[:], " "))
}