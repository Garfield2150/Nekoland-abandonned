_get_bounding_box:
	;prepare data in registers
	mov ecx, dword [neko_rect.x]
	add ecx, dword [neko_rect.w]
	mov eax, dword [image_rect.x]
	add eax, dword [image_rect.w]
	
	mov edx, dword [neko_rect.y]
	add edx, dword [neko_rect.h]
	mov ebx, dword [image_rect.y]
	add ebx, dword [image_rect.h]
	ret

_check_collision:
	call _get_bounding_box

	;check the case there is no collision
	cmp dword [neko_rect.x], eax
	jge _no_collision
	cmp dword [image_rect.x], ecx
	jge _no_collision
	cmp dword [neko_rect.y], ebx
	jge _no_collision
	cmp dword [image_rect.y], edx
	jge _no_collision
	
	mov eax, true
	ret
	
	_no_collision:
	mov eax, false
	ret

_check_enter:
	call _get_bounding_box

	;check the case there is no collision
	cmp dword [neko_rect.x], eax
	jge _no_collision
	cmp dword [image_rect.x], ecx
	jge _no_collision
	cmp dword [neko_rect.y], ebx
	jge _no_collision
	cmp dword [image_rect.y], edx
	jge _no_collision

	push NULL
	call _SDL_GetKeyboardState
	add esp, 4*1
	cmp dword [eax+SDL_SCANCODE_SPACE], true
	je _check_enter_done
	mov eax, false
	ret
	_check_enter_done:
		mov eax, true
		ret

_physics_wall:
	call _get_bounding_box
	
	;check the case there is no collision
	cmp dword [neko_rect.x], eax
	jge _no_collision
	cmp dword [image_rect.x], ecx
	jge _no_collision
	cmp dword [neko_rect.y], ebx
	jge _no_collision
	cmp dword [image_rect.y], edx
	jge _no_collision
	
	;stop the player depends on key
	push NULL
	call _SDL_GetKeyboardState
	add esp, 4*1
	cmp dword [eax+SDL_SCANCODE_UP], true
	je _stop_up
	cmp dword [eax+SDL_SCANCODE_DOWN], true
	je _stop_down
	cmp dword [eax+SDL_SCANCODE_LEFT], true
	je _stop_left
	cmp dword [eax+SDL_SCANCODE_RIGHT], true
	je _stop_right
	ret
	
	_stop_up:
		cmp dword [eax+SDL_SCANCODE_LSHIFT], true
		je _stop_run_up
		add dword [neko_rect.y], speed
		ret
	_stop_down:
		cmp dword [eax+SDL_SCANCODE_LSHIFT], true
		je _stop_run_down
		sub dword [neko_rect.y], speed
		ret
	_stop_left:
		cmp dword [eax+SDL_SCANCODE_LSHIFT], true
		je _stop_run_left
		add dword [neko_rect.x], speed
		ret
	_stop_right:
		cmp dword [eax+SDL_SCANCODE_LSHIFT], true
		je _stop_run_right
		sub dword [neko_rect.x], speed
		ret
	_stop_run_up:
		add dword [neko_rect.y], speed*speed_up*2
		ret
	_stop_run_down:
		sub dword [neko_rect.y], speed*speed_up*2
		ret
	_stop_run_left:
		add dword [neko_rect.x], speed*speed_up*2
		ret
	_stop_run_right:
		sub dword [neko_rect.x], speed*speed_up*2
		ret
		
_check_click:
	;prepare data in registers
	mov ecx, dword [mouse_rect.x]
	add ecx, dword [mouse_rect.w]
	mov eax, dword [image_rect.x]
	add eax, dword [image_rect.w]
	
	mov edx, dword [mouse_rect.y]
	add edx, dword [mouse_rect.h]
	mov ebx, dword [image_rect.y]
	add ebx, dword [image_rect.h]
	
	;check the case there is no collision
	cmp dword [mouse_rect.x], eax
	jge _no_collision
	cmp dword [image_rect.x], ecx
	jge _no_collision
	cmp dword [mouse_rect.y], ebx
	jge _no_collision
	cmp dword [image_rect.y], edx
	jge _no_collision
	
	push NULL
	push NULL
	call _SDL_GetMouseState
	add esp, 4*2
	cmp eax, true
	jne _no_collision
	
	mov eax, true
	ret
	
_check_click_ui:
	;prepare data in registers
	mov ecx, dword [mouse_rect.x]
	add ecx, dword [mouse_rect.w]
	mov eax, dword [ui_rect.x]
	add eax, dword [ui_rect.w]
	
	mov edx, dword [mouse_rect.y]
	add edx, dword [mouse_rect.h]
	mov ebx, dword [ui_rect.y]
	add ebx, dword [ui_rect.h]
	
	;check the case there is no collision
	cmp dword [mouse_rect.x], eax
	jge _no_collision
	cmp dword [ui_rect.x], ecx
	jge _no_collision
	cmp dword [mouse_rect.y], ebx
	jge _no_collision
	cmp dword [ui_rect.y], edx
	jge _no_collision
	
	push NULL
	push NULL
	call _SDL_GetMouseState
	add esp, 4*2
	cmp eax, true
	jne _no_collision
	
	mov eax, true
	ret