section .data
	;images' path
	;cursor
	cursor: db "Assets/cursor/cursor.png", 0
	;textures
	neko: db "Assets/neko/neko.png", 0
	neko_flipped: db "Assets/neko/neko_flipped.png", 0
	bed: db "Assets/textures/bed.png", 0
	cardboard: db "Assets/textures/cardboard.png", 0
	cobblestone: db "Assets/textures/cobblestone.png", 0
	creamy: db "Assets/textures/creamy.png", 0
	door: db "Assets/textures/door.png", 0
	gear: db "Assets/textures/gear.png", 0
	grass: db "Assets/textures/grass.png", 0
	idioma: db "Assets/textures/idioma.png", 0
	lamp: db "Assets/textures/lamp.png", 0
	wall: db "Assets/textures/wall.png", 0
	wood: db "Assets/textures/wood.png", 0
	;places
	house: db "Assets/places/house.png", 0
	main_menu: db "Assets/places/main_menu.png", 0
	shop: db "Assets/places/shop.png", 0
	;inventory
	coin: db "Assets/inventory/coin.png", 0
	inventory_texture: db "Assets/inventory/inventory.png", 0
	fish: db "Assets/inventory/fish.png", 0
	;hearts
	heart5of5: db "Assets/hearts/heart5of5.png", 0
	heart4of5: db "Assets/hearts/heart4of5.png", 0
	heart3of5: db "Assets/hearts/heart3of5.png", 0
	heart2of5: db "Assets/hearts/heart2of5.png", 0
	heart1of5: db "Assets/hearts/heart1of5.png", 0
	heart0of5: db "Assets/hearts/heart0of5.png", 0
	;texts
	new_game_text: db "Assets/texts/new_game.png", 0
	continue_text: db "Assets/texts/continue.png", 0
	mod_content_text: db "Assets/texts/mod_content.png", 0
	about_text: db "Assets/texts/about.png", 0
	settings_text: db "Assets/texts/settings.png", 0
	quit_text: db "Assets/texts/quit.png", 0
	about_content: db "Assets/texts/about_content.png", 0
	done_text: db "Assets/texts/done.png", 0
	zero: db "Assets/texts/zero.png", 0
	one: db "Assets/texts/one.png", 0
	two: db "Assets/texts/two.png", 0
	three: db "Assets/texts/three.png", 0
	four: db "Assets/texts/four.png", 0
	five: db "Assets/texts/five.png", 0
	six: db "Assets/texts/six.png", 0
	seven: db "Assets/texts/seven.png", 0
	eight: db "Assets/texts/eight.png", 0
	nine: db "Assets/texts/nine.png", 0
	save_and_quit_text: db "Assets/texts/save_and_quit.png", 0
	;tints
	black_tint: db "Assets/tints/black_tint.png", 0

section .bss
	texture:
		;cursor
		.cursor: resb 4
		;textures
		.neko: resb 4
		.neko_flipped: resb 4
		.bed: resb 4
		.cardboard: resb 4
		.cobblestone: resb 4
		.creamy: resb 4
		.door: resb 4
		.gear: resb 4
		.grass: resb 4
		.idioma: resb 4
		.lamp: resb 4
		.wall: resb 4
		.wood: resb 4
		;places
		.house: resb 4
		.main_menu: resb 4
		.shop: resb 4
		;inventory
		.coin: resb 4
		.inventory: resb 4
		.fish: resb 4
		;hearts
		.heart5of5: resb 4
		.heart4of5: resb 4
		.heart3of5: resb 4
		.heart2of5: resb 4
		.heart1of5: resb 4
		.heart0of5: resb 4
		;texts
		.new_game_text: resb 4
		.continue_text: resb 4
		.mod_content_text: resb 4
		.about_text: resb 4
		.settings_text: resb 4
		.quit_text: resb 4
		.about_content: resb 4
		.done_text: resb 4
		.zero: resb 4
		.one: resb 4
		.two: resb 4
		.three: resb 4
		.four: resb 4
		.five: resb 4
		.six: resb 4
		.seven: resb 4
		.eight: resb 4
		.nine: resb 4
		.save_and_quit_text: resb 4
		;tints
		.black_tint: resb 4

	image_rect:
		.x: resb 4
		.y: resb 4
		.w: resb 4
		.h: resb 4

section .text

_load_image:
	;load images
	
	;cursor
	;load cursor
	push cursor
	push dword [renderer]
	call _IMG_LoadTexture
	mov dword [texture.cursor], eax
	add esp, 4*2
	push 0
	push 0
	push NULL
	push NULL
	push dword [texture.cursor]
	call _SDL_QueryTexture
	add esp, 4*5
	mov dword [mouse_display.x], 0
	mov dword [mouse_display.y], 0
	mov dword [mouse_display.w], 50
	mov dword [mouse_display.h], 50
	mov dword [mouse_rect.x], 0
	mov dword [mouse_rect.y], 0
	mov dword [mouse_rect.w], 1
	mov dword [mouse_rect.h], 1
	
	;textures
	;load neko
	push neko
	push dword [renderer]
	call _IMG_LoadTexture
	mov dword [texture.neko], eax
	add esp, 4*2
	push 0
	push 0
	push NULL
	push NULL
	push dword [texture.neko]
	call _SDL_QueryTexture
	add esp, 4*5
	;load neko_flipped
	push neko_flipped
	push dword [renderer]
	call _IMG_LoadTexture
	mov dword [texture.neko_flipped], eax
	add esp, 4*2
	push 0
	push 0
	push NULL
	push NULL
	push dword [texture.neko_flipped]
	call _SDL_QueryTexture
	add esp, 4*5
	mov dword [neko_rect.x], 720
	mov dword [neko_rect.y], 340
	mov dword [neko_rect.w], 500
	mov dword [neko_rect.h], 500
	
	;load bed
	push bed
	push dword [renderer]
	call _IMG_LoadTexture
	mov dword [texture.bed], eax
	add esp, 4*2
	push 0
	push 0
	push NULL
	push NULL
	push dword [texture.bed]
	call _SDL_QueryTexture
	add esp, 4*5
	
	;load cardboard
	push cardboard
	push dword [renderer]
	call _IMG_LoadTexture
	mov dword [texture.cardboard], eax
	add esp, 4*2
	push 0
	push 0
	push NULL
	push NULL
	push dword [texture.cardboard]
	call _SDL_QueryTexture
	add esp, 4*5
	
	;load cobblestone
	push cobblestone
	push dword [renderer]
	call _IMG_LoadTexture
	mov dword [texture.cobblestone], eax
	add esp, 4*2
	push 0
	push 0
	push NULL
	push NULL
	push dword [texture.cobblestone]
	call _SDL_QueryTexture
	add esp, 4*5
	
	;load creamy
	push creamy
	push dword [renderer]
	call _IMG_LoadTexture
	mov dword [texture.creamy], eax
	add esp, 4*2
	push 0
	push 0
	push NULL
	push NULL
	push dword [texture.creamy]
	call _SDL_QueryTexture
	add esp, 4*5
	
	;load door
	push door
	push dword [renderer]
	call _IMG_LoadTexture
	mov dword [texture.door], eax
	add esp, 4*2
	push 0
	push 0
	push NULL
	push NULL
	push dword [texture.door]
	call _SDL_QueryTexture
	add esp, 4*5
	
	;load gear
	push gear
	push dword [renderer]
	call _IMG_LoadTexture
	mov dword [texture.gear], eax
	add esp, 4*2
	push 0
	push 0
	push NULL
	push NULL
	push dword [texture.gear]
	call _SDL_QueryTexture
	add esp, 4*5
	
	;load grass
	push grass
	push dword [renderer]
	call _IMG_LoadTexture
	mov dword [texture.grass], eax
	add esp, 4*2
	push 0
	push 0
	push NULL
	push NULL
	push dword [texture.grass]
	call _SDL_QueryTexture
	add esp, 4*5
	
	;load idioma
	push idioma
	push dword [renderer]
	call _IMG_LoadTexture
	mov dword [texture.idioma], eax
	add esp, 4*2
	push 0
	push 0
	push NULL
	push NULL
	push dword [texture.idioma]
	call _SDL_QueryTexture
	add esp, 4*5
	
	;load lamp
	push lamp
	push dword [renderer]
	call _IMG_LoadTexture
	mov dword [texture.lamp], eax
	add esp, 4*2
	push 0
	push 0
	push NULL
	push NULL
	push dword [texture.lamp]
	call _SDL_QueryTexture
	add esp, 4*5
	
	;load wall
	push wall
	push dword [renderer]
	call _IMG_LoadTexture
	mov dword [texture.wall], eax
	add esp, 4*2
	push 0
	push 0
	push NULL
	push NULL
	push dword [texture.wall]
	call _SDL_QueryTexture
	add esp, 4*5
	
	;load wood
	push wood
	push dword [renderer]
	call _IMG_LoadTexture
	mov dword [texture.wood], eax
	add esp, 4*2
	push 0
	push 0
	push NULL
	push NULL
	push dword [texture.wood]
	call _SDL_QueryTexture
	add esp, 4*5
	
	;places
	;load house
	push house
	push dword [renderer]
	call _IMG_LoadTexture
	mov dword [texture.house], eax
	add esp, 4*2
	push 0
	push 0
	push NULL
	push NULL
	push dword [texture.house]
	call _SDL_QueryTexture
	add esp, 4*5
	
	;load main menu
	push main_menu
	push dword [renderer]
	call _IMG_LoadTexture
	mov dword [texture.main_menu], eax
	add esp, 4*2
	push 0
	push 0
	push NULL
	push NULL
	push dword [texture.main_menu]
	call _SDL_QueryTexture
	add esp, 4*5
	
	;load shop
	push shop
	push dword [renderer]
	call _IMG_LoadTexture
	mov dword [texture.shop], eax
	add esp, 4*2
	push 0
	push 0
	push NULL
	push NULL
	push dword [texture.shop]
	call _SDL_QueryTexture
	add esp, 4*5
	
	;inventory
	;load coin
	push coin
	push dword [renderer]
	call _IMG_LoadTexture
	mov dword [texture.coin], eax
	add esp, 4*2
	push 0
	push 0
	push NULL
	push NULL
	push dword [texture.coin]
	call _SDL_QueryTexture
	add esp, 4*5
	
	;load inventory
	push inventory_texture
	push dword [renderer]
	call _IMG_LoadTexture
	mov dword [texture.inventory], eax
	add esp, 4*2
	push 0
	push 0
	push NULL
	push NULL
	push dword [texture.inventory]
	call _SDL_QueryTexture
	add esp, 4*5
	
	;load fish
	push fish
	push dword [renderer]
	call _IMG_LoadTexture
	mov dword [texture.fish], eax
	add esp, 4*2
	push 0
	push 0
	push NULL
	push NULL
	push dword [texture.fish]
	call _SDL_QueryTexture
	add esp, 4*5
	
	;hearts
	;5/5
	push heart5of5
	push dword [renderer]
	call _IMG_LoadTexture
	mov dword [texture.heart5of5], eax
	add esp, 4*2
	push 0
	push 0
	push NULL
	push NULL
	push dword [texture.heart5of5]
	call _SDL_QueryTexture
	add esp, 4*5
	;4/5
	push heart4of5
	push dword [renderer]
	call _IMG_LoadTexture
	mov dword [texture.heart4of5], eax
	add esp, 4*2
	push 0
	push 0
	push NULL
	push NULL
	push dword [texture.heart4of5]
	call _SDL_QueryTexture
	add esp, 4*5
	;3/5
	push heart3of5
	push dword [renderer]
	call _IMG_LoadTexture
	mov dword [texture.heart3of5], eax
	add esp, 4*2
	push 0
	push 0
	push NULL
	push NULL
	push dword [texture.heart3of5]
	call _SDL_QueryTexture
	add esp, 4*5
	;2/5
	push heart2of5
	push dword [renderer]
	call _IMG_LoadTexture
	mov dword [texture.heart2of5], eax
	add esp, 4*2
	push 0
	push 0
	push NULL
	push NULL
	push dword [texture.heart2of5]
	call _SDL_QueryTexture
	add esp, 4*5
	;1/5
	push heart1of5
	push dword [renderer]
	call _IMG_LoadTexture
	mov dword [texture.heart1of5], eax
	add esp, 4*2
	push 0
	push 0
	push NULL
	push NULL
	push dword [texture.heart1of5]
	call _SDL_QueryTexture
	add esp, 4*5
	;0/5
	push heart0of5
	push dword [renderer]
	call _IMG_LoadTexture
	mov dword [texture.heart0of5], eax
	add esp, 4*2
	push 0
	push 0
	push NULL
	push NULL
	push dword [texture.heart0of5]
	call _SDL_QueryTexture
	add esp, 4*5
	
	;texts
	;new game text
	push new_game_text
	push dword [renderer]
	call _IMG_LoadTexture
	mov dword [texture.new_game_text], eax
	add esp, 4*2
	push 0
	push 0
	push NULL
	push NULL
	push dword [texture.new_game_text]
	call _SDL_QueryTexture
	add esp, 4*5
	
	;continue text
	push continue_text
	push dword [renderer]
	call _IMG_LoadTexture
	mov dword [texture.continue_text], eax
	add esp, 4*2
	push 0
	push 0
	push NULL
	push NULL
	push dword [texture.continue_text]
	call _SDL_QueryTexture
	add esp, 4*5
	
	;mod content text
	push mod_content_text
	push dword [renderer]
	call _IMG_LoadTexture
	mov dword [texture.mod_content_text], eax
	add esp, 4*2
	push 0
	push 0
	push NULL
	push NULL
	push dword [texture.mod_content_text]
	call _SDL_QueryTexture
	add esp, 4*5
	
	;about text
	push about_text
	push dword [renderer]
	call _IMG_LoadTexture
	mov dword [texture.about_text], eax
	add esp, 4*2
	push 0
	push 0
	push NULL
	push NULL
	push dword [texture.about_text]
	call _SDL_QueryTexture
	add esp, 4*5
	
	;settings text
	push settings_text
	push dword [renderer]
	call _IMG_LoadTexture
	mov dword [texture.settings_text], eax
	add esp, 4*2
	push 0
	push 0
	push NULL
	push NULL
	push dword [texture.settings_text]
	call _SDL_QueryTexture
	add esp, 4*5
	
	;quit text
	push quit_text
	push dword [renderer]
	call _IMG_LoadTexture
	mov dword [texture.quit_text], eax
	add esp, 4*2
	push 0
	push 0
	push NULL
	push NULL
	push dword [texture.quit_text]
	call _SDL_QueryTexture
	add esp, 4*5
	
	;about content
	push about_content
	push dword [renderer]
	call _IMG_LoadTexture
	mov dword [texture.about_content], eax
	add esp, 4*2
	push 0
	push 0
	push NULL
	push NULL
	push dword [texture.about_content]
	call _SDL_QueryTexture
	add esp, 4*5
	
	;done text
	push done_text
	push dword [renderer]
	call _IMG_LoadTexture
	mov dword [texture.done_text], eax
	add esp, 4*2
	push 0
	push 0
	push NULL
	push NULL
	push dword [texture.done_text]
	call _SDL_QueryTexture
	add esp, 4*5
	
	;zero
	push zero
	push dword [renderer]
	call _IMG_LoadTexture
	mov dword [texture.zero], eax
	add esp, 4*2
	push 0
	push 0
	push NULL
	push NULL
	push dword [texture.zero]
	call _SDL_QueryTexture
	add esp, 4*5
	
	;one
	push one
	push dword [renderer]
	call _IMG_LoadTexture
	mov dword [texture.one], eax
	add esp, 4*2
	push 0
	push 0
	push NULL
	push NULL
	push dword [texture.one]
	call _SDL_QueryTexture
	add esp, 4*5
	
	;two
	push two
	push dword [renderer]
	call _IMG_LoadTexture
	mov dword [texture.two], eax
	add esp, 4*2
	push 0
	push 0
	push NULL
	push NULL
	push dword [texture.two]
	call _SDL_QueryTexture
	add esp, 4*5
	
	;three
	push three
	push dword [renderer]
	call _IMG_LoadTexture
	mov dword [texture.three], eax
	add esp, 4*2
	push 0
	push 0
	push NULL
	push NULL
	push dword [texture.three]
	call _SDL_QueryTexture
	add esp, 4*5
	
	;four
	push four
	push dword [renderer]
	call _IMG_LoadTexture
	mov dword [texture.four], eax
	add esp, 4*2
	push 0
	push 0
	push NULL
	push NULL
	push dword [texture.four]
	call _SDL_QueryTexture
	add esp, 4*5
	
	;five
	push five
	push dword [renderer]
	call _IMG_LoadTexture
	mov dword [texture.five], eax
	add esp, 4*2
	push 0
	push 0
	push NULL
	push NULL
	push dword [texture.five]
	call _SDL_QueryTexture
	add esp, 4*5
	
	;six
	push six
	push dword [renderer]
	call _IMG_LoadTexture
	mov dword [texture.six], eax
	add esp, 4*2
	push 0
	push 0
	push NULL
	push NULL
	push dword [texture.six]
	call _SDL_QueryTexture
	add esp, 4*5
	
	;seven
	push seven
	push dword [renderer]
	call _IMG_LoadTexture
	mov dword [texture.seven], eax
	add esp, 4*2
	push 0
	push 0
	push NULL
	push NULL
	push dword [texture.seven]
	call _SDL_QueryTexture
	add esp, 4*5
	
	;eight
	push eight
	push dword [renderer]
	call _IMG_LoadTexture
	mov dword [texture.eight], eax
	add esp, 4*2
	push 0
	push 0
	push NULL
	push NULL
	push dword [texture.eight]
	call _SDL_QueryTexture
	add esp, 4*5
	
	;nine
	push nine
	push dword [renderer]
	call _IMG_LoadTexture
	mov dword [texture.nine], eax
	add esp, 4*2
	push 0
	push 0
	push NULL
	push NULL
	push dword [texture.nine]
	call _SDL_QueryTexture
	add esp, 4*5
	
	;save and quit text
	push save_and_quit_text
	push dword [renderer]
	call _IMG_LoadTexture
	mov dword [texture.save_and_quit_text], eax
	add esp, 4*2
	push 0
	push 0
	push NULL
	push NULL
	push dword [texture.save_and_quit_text]
	call _SDL_QueryTexture
	add esp, 4*5
	
	;tints
	;black_tint
	push black_tint
	push dword [renderer]
	call _IMG_LoadTexture
	mov dword [texture.black_tint], eax
	add esp, 4*2
	push 0
	push 0
	push NULL
	push NULL
	push dword [texture.black_tint]
	call _SDL_QueryTexture
	add esp, 4*5
	
	ret