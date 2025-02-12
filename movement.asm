_start_check_key:
	push NULL
	call _SDL_GetKeyboardState
	add esp, 4*1
	cmp dword [eax+SDL_SCANCODE_UP], true
	je _key_up
	cmp dword [eax+SDL_SCANCODE_DOWN], true
	je _key_down
	cmp dword [eax+SDL_SCANCODE_LEFT], true
	je _key_left
	cmp dword [eax+SDL_SCANCODE_RIGHT], true
	je _key_right
	cmp dword [eax+SDL_SCANCODE_ESCAPE], true
	je _set_pause
	ret
	
	_key_up:
		cmp dword [eax+SDL_SCANCODE_LSHIFT], true
		je _run_up
		add dword [image_rect.y], speed
		ret
	_key_down:
		cmp dword [eax+SDL_SCANCODE_LSHIFT], true
		je _run_down
		sub dword [image_rect.y], speed
		ret
	_key_left:
		mov dword [flip], true
		cmp dword [eax+SDL_SCANCODE_LSHIFT], true
		je _run_left
		add dword [image_rect.x], speed
		ret
	_key_right:
		mov dword [flip], false
		cmp dword [eax+SDL_SCANCODE_LSHIFT], true
		je _run_right
		sub dword [image_rect.x], speed
		ret
	_run_up:
		sub dword [neko_rect.y], speed
		add dword [image_rect.y], speed*speed_up
		ret
	_run_down:
		add dword [neko_rect.y], speed
		sub dword [image_rect.y], speed*speed_up
		ret
	_run_left:
		sub dword [neko_rect.x], speed
		add dword [image_rect.x], speed*speed_up
		ret
	_run_right:
		add dword [neko_rect.x], speed
		sub dword [image_rect.x], speed*speed_up
		ret
	_set_pause:
		mov dword [is_pause], true
		ret