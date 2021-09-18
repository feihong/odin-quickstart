package main

import "core:fmt"
import "core:strings"


dict := map[string]string{
  "hello" = "你好",
  "world" = "世界",
  "goodbye" = "再见",
  "universe" = "宇宙",
  "feed" = "喂",
  "cat" = "猫",
}

translate :: proc(sentence: string) {
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
  translate("hello world")
  translate("goodbye universe")
  translate("feed the cat")
  translate("hello ted")
}