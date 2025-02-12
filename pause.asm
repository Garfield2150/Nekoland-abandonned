_is_pause:
	cmp dword [is_pause], true
	je _pause
	ret
	_pause:
		;draw background
		push NULL
		push NULL
		push dword [texture.cobblestone]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		
		;draw continue button
		mov dword [ui_rect.x], 460
		mov dword [ui_rect.y], 250
		mov dword [ui_rect.w], 1000
		mov dword [ui_rect.h], 250
		push ui_rect
		push NULL
		push dword [texture.cardboard]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		call _check_click_ui
		cmp eax, true
		je _stop_pause
		;continue text
		push ui_rect
		push NULL
		push dword [texture.continue_text]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		
		;draw save and exit button
		mov dword [ui_rect.x], 460
		mov dword [ui_rect.y], 800
		mov dword [ui_rect.w], 1000
		mov dword [ui_rect.h], 250
		push ui_rect
		push NULL
		push dword [texture.cardboard]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		call _check_click_ui
		cmp eax, true
		je _save_and_exit
		;save and quit text
		push ui_rect
		push NULL
		push dword [texture.save_and_quit_text]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
	
		jmp _update
		
		_stop_pause:
			mov dword [is_pause], false
			ret
		_save_and_exit:
			;open file
			push format_write_binary
			push save_file_path
			call _fopen
			add esp, 4*2
			mov dword [save_file], eax
			;save health
			push dword [save_file]
			push 1
			push 4
			push health
			call _fwrite
			add esp, 4*4
			;save scene
			push dword [save_file]
			push 1
			push 4
			push scene
			call _fwrite
			;save coin
			push dword [save_file]
			push 1
			push 4
			push inventory.coin
			call _fwrite
			;save inventory
			push dword [save_file]
			push 1
			push 4
			push inventory.item1
			call _fwrite
			push dword [save_file]
			push 1
			push 4
			push inventory.amount1
			call _fwrite
			push dword [save_file]
			push 1
			push 4
			push inventory.item2
			call _fwrite
			push dword [save_file]
			push 1
			push 4
			push inventory.amount2
			call _fwrite
			push dword [save_file]
			push 1
			push 4
			push inventory.item3
			call _fwrite
			push dword [save_file]
			push 1
			push 4
			push inventory.amount3
			call _fwrite
			
			jmp _exit
			ret