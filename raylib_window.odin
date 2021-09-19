package main

import "vendor:raylib"

main :: proc() {
  using raylib

  InitWindow(800, 450, "Ths is raylib in Odin!")

  for !WindowShouldClose() {
    BeginDrawing()
      ClearBackground(RAYWHITE)
      DrawText("Congratulations on getting it to work!", 190, 200, 20, LIGHTGRAY)
    EndDrawing()
  }

  CloseWindow()
}