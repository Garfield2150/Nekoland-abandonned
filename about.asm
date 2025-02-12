_about:
	;draw background
	push NULL
	push NULL
	push dword [texture.main_menu]
	push dword [renderer]
	call _SDL_RenderCopy
	add esp, 4*4

	;draw black tint
	mov dword [image_rect.x], 100
	mov dword [image_rect.y], 100
	mov dword [image_rect.w], 1720
	mov dword [image_rect.h], 900
	push image_rect
	push NULL
	push dword [texture.black_tint]
	push dword [renderer]
	call _SDL_RenderCopy
	add esp, 4*4

	;draw about content
	mov dword [image_rect.x], 100
	mov dword [image_rect.y], 100
	mov dword [image_rect.w], 1720
	mov dword [image_rect.h], 500
	push image_rect
	push NULL
	push dword [texture.about_content]
	push dword [renderer]
	call _SDL_RenderCopy
	add esp, 4*4

	;draw done button
	mov dword [image_rect.x], 680
	mov dword [image_rect.y], 950
	mov dword [image_rect.w], 500
	mov dword [image_rect.h], 90
	call _check_click
	cmp eax, true
	je _goto_scene0
	push image_rect
	push NULL
	push dword [texture.cardboard]
	push dword [renderer]
	call _SDL_RenderCopy
	add esp, 4*4
	;done text
	push image_rect
	push NULL
	push dword [texture.done_text]
	push dword [renderer]
	call _SDL_RenderCopy
	add esp, 4*4
	
	jmp _update