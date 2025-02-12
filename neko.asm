_render_neko:
	cmp dword [flip], false
	je _draw_flipped_neko
	;draw normal neko
	push neko_rect
	push NULL
	push dword [texture.neko]
	push dword [renderer]
	call _SDL_RenderCopy
	add esp, 4*4
	jmp _no_flip_neko
	;draw flipped version of neko
	_draw_flipped_neko:
	push neko_rect
	push NULL
	push dword [texture.neko_flipped]
	push dword [renderer]
	call _SDL_RenderCopy
	add esp, 4*4
	_no_flip_neko:
	ret