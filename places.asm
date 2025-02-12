;scenes
%include "main_menu.asm"
%include "about.asm"
%include "scenes/scene1.asm"
%include "scenes/scene2.asm"

_goto_about:
	mov dword [neko_rect.x], 720
	mov dword [neko_rect.y], 340
	mov dword [image_rect.x], 0
	mov dword [image_rect.y], 0
	mov dword [scene], -1
	jmp _main_loop

_goto_scene0:
	mov dword [neko_rect.x], 720
	mov dword [neko_rect.y], 340
	mov dword [image_rect.x], 0
	mov dword [image_rect.y], 0
	mov dword [scene], 0
	jmp _main_loop

_goto_scene1:
	mov dword [neko_rect.x], 720
	mov dword [neko_rect.y], 340
	mov dword [image_rect.x], 0
	mov dword [image_rect.y], 0
	mov dword [scene], 1
	jmp _main_loop

_goto_scene2:
	mov dword [neko_rect.x], 720
	mov dword [neko_rect.y], 340
	mov dword [image_rect.x], 0
	mov dword [image_rect.y], 0
	mov dword [scene], 2
	jmp _main_loop
	
_goto_scene3:
	mov dword [neko_rect.x], 720
	mov dword [neko_rect.y], 340
	mov dword [image_rect.x], 0
	mov dword [image_rect.y], 0
	mov dword [scene], 3
	jmp _main_loop