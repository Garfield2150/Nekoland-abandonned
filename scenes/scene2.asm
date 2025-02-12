_scene2:
	;check if player pauses
	call _is_pause

	;set background color
	push 255
	push 82
	push 248
	push 50
	push dword [renderer]
	call _SDL_SetRenderDrawColor
	add esp, 4*5
	push dword [renderer]
	call _SDL_RenderClear
	add esp, 4*1
	
	;check key
	call _start_check_key
	
	;camera script
	call _camera
	
	;draw grass
	add dword [image_rect.x], 0
	add dword [image_rect.y], 0
	mov dword [image_rect.w], 1280
	mov dword [image_rect.h], 1280
	push image_rect
	push NULL
	push dword [texture.grass]
	push dword [renderer]
	call _SDL_RenderCopy
	sub dword [image_rect.x], 0
	sub dword [image_rect.y], 0
	add esp, 4*4
	
	;draw house
	add dword [image_rect.x], 720
	add dword [image_rect.y], -700
	mov dword [image_rect.w], 834
	mov dword [image_rect.h], 896
	call _check_enter
	cmp eax, true
	je _goto_scene1
	call _physics_wall
	push image_rect
	push NULL
	push dword [texture.house]
	push dword [renderer]
	call _SDL_RenderCopy
	sub dword [image_rect.x], 720
	sub dword [image_rect.y], -700
	add esp, 4*4
	
	;render neko
	call _render_neko
	
	;render ui and item
	call _render_ui
	call _render_item

	jmp _update