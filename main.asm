%include "lib.asm"
%include "image.asm"
%include "game_logic.asm"

global  _main

section .data
	;about window
	window_title: db "Nekoland: the epik adventure [V.1.0a]", 0
	screen_width equ 1920
	screen_height equ 1000
	
	;formats
	format_str_output: db "%s", 10, 0
	format_str: db "%s", 0
	format_int: db "%d", 0
	format_int_output: db "%d", 10, 0
	newline: db 10, 0
	
	format_write_binary: db "wb", 0
	format_read_binary: db "rb", 0
	save_file_path: db "data.dat", 0

section .bss
	window: resb 4
	renderer: resb 4
	save_file: resb 4

section .text

;main entry point
_main:
	;calling convention
	push ebp
    mov ebp,esp
	
	;initialize SDL
	push SDL_INIT_EVERYTHING
	call _SDL_Init
	add esp, 4*1
	;init png
	push dword IMG_INIT_PNG
	call _IMG_Init
	add esp, 4*1
	
	;create window
	push SDL_WINDOW_SHOWN
	push screen_height
	push screen_width
	push SDL_WINDOWPOS_CENTERED_MASK
	push SDL_WINDOWPOS_CENTERED_MASK
	push window_title
	call _SDL_CreateWindow
	mov dword [window], eax
	add esp, 4*6
	;set window fullscreen
	push SDL_WINDOW_FULLSCREEN
	;push NULL
	push dword [window]
	call _SDL_SetWindowFullscreen
	add esp, 4*2
	
	;create renderer
	push (SDL_RENDERER_ACCELERATED+SDL_RENDERER_PRESENTVSYNC)
	push -1
	push dword [window]
	call _SDL_CreateRenderer
	mov dword [renderer], eax
	add esp, 4*3
	
	;turn cursor off
	push false
	call _SDL_ShowCursor
	add esp, 4*1
	
	call _load_image
	
	;jump to main loop in the file game_logic.asm
	jmp _main_loop

;prepare for exit
_exit:
	;exit application
	push dword [renderer]
	call _SDL_DestroyRenderer
	add esp, 4*1
	push dword [window]
	call _SDL_DestroyWindow
	add esp, 4*1
	push dword [texture]
	call _SDL_DestroyTexture
	add esp, 4*1
	call _IMG_Quit
	call _SDL_Quit
	
	;leaving convention
	mov esp, ebp
	pop ebp
	
	xor eax, eax
	ret