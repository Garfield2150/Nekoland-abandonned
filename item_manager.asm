nothing_item equ 0
fish_item equ 1
sword_item equ 2
bow_item equ 3
arrow_item equ 4

section .bss
inventory:
		.coin: resb 4
		.item1: resb 4
		.item2: resb 4
		.item3: resb 4
		.amount1: resb 4
		.amount2: resb 4
		.amount3: resb 4

section .text

_render_item:
	;first slot
	cmp dword [inventory.item1], nothing_item
	je _item1_nothing
	cmp dword [inventory.amount1], 0
	jle _item1_nothing
	cmp dword [inventory.item1], fish_item
	je _item1_fish
	cmp dword [inventory.item1], sword_item
	je _item1_sword
	
	_render_item2:
	;second slot
	cmp dword [inventory.item2], nothing_item
	je _item2_nothing
	cmp dword [inventory.amount2], 0
	jle _item2_nothing
	cmp dword [inventory.item2], fish_item
	je _item2_fish
	
	_render_item3:
	;third slot
	cmp dword [inventory.item3], nothing_item
	je _item3_nothing
	cmp dword [inventory.amount3], 0
	jle _item3_nothing
	cmp dword [inventory.item3], fish_item
	je _item3_fish
	
	ret
	
	_item1_nothing:
		mov dword [inventory.item1], nothing_item
		mov dword [inventory.amount1], 0
		mov dword [ui_rect.x], 1600
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 281
		mov dword [ui_rect.h], 290
		push ui_rect
		push NULL
		push NULL
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _render_item2
		
	_item2_nothing:
		mov dword [inventory.item2], nothing_item
		mov dword [inventory.amount2], 0
		mov dword [ui_rect.x], 1600
		mov dword [ui_rect.y], 290
		mov dword [ui_rect.w], 281
		mov dword [ui_rect.h], 290
		push ui_rect
		push NULL
		push NULL
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _render_item3
		
	_item3_nothing:
		mov dword [inventory.item3], nothing_item
		mov dword [inventory.amount3], 0
		mov dword [ui_rect.x], 1600
		mov dword [ui_rect.y], 580
		mov dword [ui_rect.w], 281
		mov dword [ui_rect.h], 290
		push ui_rect
		push NULL
		push NULL
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		ret
	
	_item1_fish:
		mov dword [ui_rect.x], 1600
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 300
		mov dword [ui_rect.h], 300
		push ui_rect
		push NULL
		push dword [texture.fish]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _render_item2
		
	_item2_fish:
		mov dword [ui_rect.x], 1600
		mov dword [ui_rect.y], 290
		mov dword [ui_rect.w], 300
		mov dword [ui_rect.h], 300
		push ui_rect
		push NULL
		push dword [texture.fish]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _render_item3
		
	_item3_fish:
		mov dword [ui_rect.x], 1600
		mov dword [ui_rect.y], 580
		mov dword [ui_rect.w], 300
		mov dword [ui_rect.h], 300
		push ui_rect
		push NULL
		push dword [texture.fish]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		ret
		