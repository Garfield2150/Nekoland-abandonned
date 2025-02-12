@echo off
nasm -felf32 -o ./main.o ./main.asm
gcc -LSDL2/lib main.o -o a -lSDL2 -lSDL2_image
