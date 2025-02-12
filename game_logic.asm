%include "movement.asm"
%include "physics.asm"
%include "ui.asm"
%include "item_manager.asm"
%include "places.asm"
%include "neko.asm"
%include "camera.asm"
%include "pause.asm"

;player constant
speed equ 3
speed_up equ 3

section .bss
	mouse_display:
		.x: resb 4
		.y: resb 4
		.w: resb 4
		.h: resb 4
	
	mouse_rect:
		.x: resb 4
		.y: resb 4
		.w: resb 4
		.h: resb 4
	
	neko_rect:
		.x: resb 4
		.y: resb 4
		.w: resb 4
		.h: resb 4
	flip: resb 4
	scene: resb 4
	progression: resb 4
	health: resb 4
	is_pause: resb 4
	
	event:
		.type: resb 4
		.other: resb 256

section .text

;main loop
_main_loop:
	;check if user exit the application
	push event
	call _SDL_PollEvent
	add esp, 4*1
	cmp dword [event.type], SDL_QUIT
	je _exit
	
	;check which scene player is in
	cmp dword [scene], -1
	je _about
	cmp dword [scene], 0
	je _main_menu
	cmp dword [scene], 1
	je _scene1
	cmp dword [scene], 2
	je _scene2
	
	;update the screen
	_update:
		;draw custom cursor
		mov dword [mouse_rect.w], 1
		mov dword [mouse_rect.h], 1
		push mouse_display.y
		push mouse_display.x
		call _SDL_GetMouseState
		add esp, 4*2
		mov eax, dword [mouse_display.x]
		mov ebx, dword [mouse_display.y]
		mov dword [mouse_rect.x], eax
		mov dword [mouse_rect.y], ebx
		push mouse_display
		push NULL
		push dword [texture.cursor]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		
		;display screen
		push dword [renderer]
		call _SDL_RenderPresent
		add esp, 4*1
	
	jmp _main_loop