NOTE: This project is discontinued! but I still wanna share it on github


Nekoland: the epik adventure
---------------------------------------------

Dear users:
	This game takes me so long to write,
because it is written in assembly(programming language that is quite difficult to learn),
I hope you enjoy the game. I put a lot of time and effort into this game.
if you want to play on other versions of the game you could download from the website
if the game doesn't work try reassemble or linking the code yourself or try on another device or using virtual machine
-------------------------------------------------------------------------------------------------------------------------------------------------
Dear modders:
	If you want to mod the game the game is already open-source,
you can edit and reassemble .asm files using netwide assembler(NASM). this game uses SDL library,
but instead of calling functions from the library with C you call with assembly code.
This way the code is more portable and don't have to rewrite for different operating system.
the assembling process I use 32 bit because I want this to be compatible with older computers.
you could also mod the game in C and somehow make it compatible with existing assembly codes.
--------------------------------------------------------------------------------------------------------------------------------------------------
project layout:
	Assets folder for loading textures in png file format and sound in wav format.
SDL2 folder is the actual library I use for this project it already contains SDL_image too
build.bat for assembling the code if you're not on windows you have to write another build script yourself.
scenes folder contain all of the assembly files that generates the areas in the game.
lib.asm file is for externing functions from SDL and define constant
main.asm file is an entry point of program.
image.asm file is for loading images.
audio.asm file is for loading sounds.
movement.asm file is for character movement script and reading keys.
main_menu.asm file is for generate the main menu.
physics.asm file is for using simple physics functions that I wrote by myself like wall physics and collision.
places.asm file is for teleporting player to different scene in the game together.
camera.asm file is for camera script.
ui.asm file is for rendering user's UI.
neko.asm file is for rendering neko.
about.asm file is for loading about screen
mod-content folder specifically for all mods/additional content for easy modification
item_management.asm file responsible for anything related to item and inventory
pause.asm file is for pause menu
-----------------------------------------------------------------------------------------------------------------------------------------------------
