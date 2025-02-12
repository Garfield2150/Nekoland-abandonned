_scene1:
	;check if player pauses
	call _is_pause
	
	;set background color
	push 255
	push 0
	push 0
	push 0
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
	
	;reset size
	mov dword [image_rect.w], 0
	mov dword [image_rect.h], 0
	
	;draw floor
	add dword [image_rect.x], 0
	add dword [image_rect.y], -200
	mov dword [image_rect.w], 2100
	mov dword [image_rect.h], 1500
	push image_rect
	push NULL
	push dword [texture.wood]
	push dword [renderer]
	call _SDL_RenderCopy
	sub dword [image_rect.x], 0
	sub dword [image_rect.y], -200
	add esp, 4*4
	
	;draw walls
	add dword [image_rect.x], 0
	add dword [image_rect.y], -700
	mov dword [image_rect.w], 2100
	mov dword [image_rect.h], 500
	call _physics_wall
	push image_rect
	push NULL
	push dword [texture.creamy]
	push dword [renderer]
	call _SDL_RenderCopy
	sub dword [image_rect.x], 0
	sub dword [image_rect.y], -700
	add esp, 4*4
	add dword [image_rect.x], 0
	add dword [image_rect.y], 1300
	call _physics_wall
	push image_rect
	push NULL
	push dword [texture.creamy]
	push dword [renderer]
	call _SDL_RenderCopy
	sub dword [image_rect.x], 0
	sub dword [image_rect.y], 1300
	add esp, 4*4
	add dword [image_rect.x], -300
	add dword [image_rect.y], -700
	mov dword [image_rect.w], 300
	mov dword [image_rect.h], 2500
	call _physics_wall
	push image_rect
	push NULL
	push dword [texture.creamy]
	push dword [renderer]
	call _SDL_RenderCopy
	sub dword [image_rect.x], -300
	add esp, 4*4
	add dword [image_rect.x], 2100
	call _physics_wall
	push image_rect
	push NULL
	push dword [texture.creamy]
	push dword [renderer]
	call _SDL_RenderCopy
	sub dword [image_rect.x], 2100
	sub dword [image_rect.y], -700
	add esp, 4*4
	
	;draw lamp
	add dword [image_rect.x], 1800
	add dword [image_rect.y], -100
	mov dword [image_rect.w], 300
	mov dword [image_rect.h], 300
	push image_rect
	push NULL
	push dword [texture.lamp]
	push dword [renderer]
	call _SDL_RenderCopy
	sub dword [image_rect.x], 1800
	sub dword [image_rect.y], -100
	add esp, 4*4
	
	;draw bed
	add dword [image_rect.x], 1000
	add dword [image_rect.y], -100
	mov dword [image_rect.w], 738
	mov dword [image_rect.h], 341
	call _physics_wall
	push image_rect
	push NULL
	push dword [texture.bed]
	push dword [renderer]
	call _SDL_RenderCopy
	sub dword [image_rect.x], 1000
	sub dword [image_rect.y], -100
	add esp, 4*4
	
	;render neko
	call _render_neko
	
	;draw door
	add dword [image_rect.x], 800
	add dword [image_rect.y], 1000
	mov dword [image_rect.w], 355
	mov dword [image_rect.h], 631
	call _check_enter
	cmp eax, true
	je _goto_scene2
	push image_rect
	push NULL
	push dword [texture.door]
	push dword [renderer]
	call _SDL_RenderCopy
	sub dword [image_rect.x], 800
	sub dword [image_rect.y], 1000
	add esp, 4*4
	
	;render ui and item
	call _render_ui
	call _render_item
	
	jmp _update