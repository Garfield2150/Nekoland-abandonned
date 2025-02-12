_main_menu:
	;draw background
	push NULL
	push NULL
	push dword [texture.main_menu]
	push dword [renderer]
	call _SDL_RenderCopy
	add esp, 4*4
	
	;draw new game button
	mov dword [image_rect.x], 50
	mov dword [image_rect.y], 420
	mov dword [image_rect.w], 500
	mov dword [image_rect.h], 90
	push image_rect
	push NULL
	push dword [texture.cardboard]
	push dword [renderer]
	call _SDL_RenderCopy
	add esp, 4*4
	call _check_click
	cmp eax, true
	je _new_game
	;new game text
	push image_rect
	push NULL
	push dword [texture.new_game_text]
	push dword [renderer]
	call _SDL_RenderCopy
	add esp, 4*4
	
	;draw continue button
	mov dword [image_rect.y], 520
	push image_rect
	push NULL
	push dword [texture.cardboard]
	push dword [renderer]
	call _SDL_RenderCopy
	add esp, 4*4
	call _check_click
	cmp eax, true
	je _continue_game
	;continue text
	push image_rect
	push NULL
	push dword [texture.continue_text]
	push dword [renderer]
	call _SDL_RenderCopy
	add esp, 4*4
	
	;draw mod content button
	mov dword [image_rect.y], 620
	push image_rect
	push NULL
	push dword [texture.cardboard]
	push dword [renderer]
	call _SDL_RenderCopy
	add esp, 4*4
	;mod content text
	push image_rect
	push NULL
	push dword [texture.mod_content_text]
	push dword [renderer]
	call _SDL_RenderCopy
	add esp, 4*4
	
	;draw about button
	mov dword [image_rect.y], 720
	push image_rect
	push NULL
	push dword [texture.cardboard]
	push dword [renderer]
	call _SDL_RenderCopy
	add esp, 4*4
	call _check_click
	cmp eax, true
	je _goto_about
	;about text
	mov dword [image_rect.w], 250
	mov dword [image_rect.x], 150
	push image_rect
	push NULL
	push dword [texture.about_text]
	push dword [renderer]
	call _SDL_RenderCopy
	add esp, 4*4
	mov dword [image_rect.w], 500
	mov dword [image_rect.x], 50
	
	;draw settings button
	mov dword [image_rect.y], 820
	push image_rect
	push NULL
	push dword [texture.cardboard]
	push dword [renderer]
	call _SDL_RenderCopy
	add esp, 4*4
	;settings text
	push image_rect
	push NULL
	push dword [texture.settings_text]
	push dword [renderer]
	call _SDL_RenderCopy
	add esp, 4*4
	
	;draw quit button
	mov dword [image_rect.y], 920
	call _check_click
	cmp eax, true
	je _exit
	push image_rect
	push NULL
	push dword [texture.cardboard]
	push dword [renderer]
	call _SDL_RenderCopy
	add esp, 4*4
	;quit text
	mov dword [image_rect.w], 250
	mov dword [image_rect.x], 150
	push image_rect
	push NULL
	push dword [texture.quit_text]
	push dword [renderer]
	call _SDL_RenderCopy
	add esp, 4*4
	
	jmp _update
	
_new_game:
	;initialize data
	mov dword [health], 15
	mov dword [scene], 1
	mov dword [inventory.coin], 0
	mov dword [inventory.item1], 0
	mov dword [inventory.amount1], 0
	mov dword [inventory.item2], 0
	mov dword [inventory.amount2], 0
	mov dword [inventory.item3], 0
	mov dword [inventory.amount3], 0
	mov dword [image_rect.x], 0
	mov dword [image_rect.y], 0
	
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
	
	jmp _update
	
_continue_game:
	mov dword [image_rect.x], 0
	mov dword [image_rect.y], 0
	
	;open file
	push format_read_binary
	push save_file_path
	call _fopen
	add esp, 4*2
	mov dword [save_file], eax
	;load health
	push dword [save_file]
	push 1
	push 4
	push health
	call _fread
	add esp, 4*4
	;load scene
	push dword [save_file]
	push 1
	push 4
	push scene
	call _fread
	add esp, 4*4
	;load coin
	push dword [save_file]
	push 1
	push 4
	push inventory.coin
	call _fread
	;load inventory
	push dword [save_file]
	push 1
	push 4
	push inventory.item1
	call _fread
	push dword [save_file]
	push 1
	push 4
	push inventory.amount1
	call _fread
	push dword [save_file]
	push 1
	push 4
	push inventory.item2
	call _fread
	push dword [save_file]
	push 1
	push 4
	push inventory.amount2
	call _fread
	push dword [save_file]
	push 1
	push 4
	push inventory.item3
	call _fread
	push dword [save_file]
	push 1
	push 4
	push inventory.amount3
	call _fread
	
	jmp _update