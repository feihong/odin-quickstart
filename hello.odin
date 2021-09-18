package main

import "core:fmt"
import "core:strings"

translate :: proc(sentence: string, dict: map[string]string) {
  words := strings.split(sentence, " ")
  words2 := make([dynamic]string, len(words))
  defer {
    delete(words)  
    delete(words2)
  }

  
  for _, i in words {
    words2[i] = dict[words[i]] or_else words[i]
  }

  sentence2 := strings.join(words2[:], " ")
  defer delete(sentence2)
  fmt.println(sentence2)
}

main :: proc() {
  dict := map[string]string{
    "hello" = "你好",
    "world" = "世界",
    "goodbye" = "再见",
    "universe" = "宇宙",
    "feed" = "喂",
    "cat" = "猫",
  }


  translate("hello world", dict)
  translate("goodbye universe", dict)
  translate("feed the cat", dict)
  translate("hello ted", dict)
}