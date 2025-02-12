section .bss
	ui_rect:
		.x: resb 4
		.y: resb 4
		.w: resb 4
		.h: resb 4
	
	decimal:
		.one: resb 4
		.ten: resb 4
		.hundred: resb 4
		.thousand: resb 4
		.ten_thousand: resb 4
		.hundred_thousand: resb 4
	
section .text

_render_ui:
	;draw coin
	mov dword [ui_rect.x], 0
	mov dword [ui_rect.y], 0
	mov dword [ui_rect.w], 218
	mov dword [ui_rect.h], 215
	push ui_rect
	push NULL
	push dword [texture.coin]
	push dword [renderer]
	call _SDL_RenderCopy
	add esp, 4*4
	
	;draw amount of coin in decimal
	mov dword [decimal.hundred_thousand], 0
	mov dword [decimal.ten_thousand], 0
	mov dword [decimal.thousand], 0
	mov dword [decimal.hundred], 0
	mov dword [decimal.ten], 0
	mov dword [decimal.one], 0
	mov ebx, dword [inventory.coin]
	cmp dword [inventory.coin], 999999
	jg _too_many_coins
	jmp _coin_to_decimal
	_too_many_coins:
		mov dword [inventory.coin], 999999
		mov ebx, dword [inventory.coin]
	_coin_to_decimal:
		cmp dword [inventory.coin], 100000
		jge _count_hundred_thousand
		cmp dword [inventory.coin], 10000
		jge _count_ten_thousand
		cmp dword [inventory.coin], 1000
		jge _count_thousand
		cmp dword [inventory.coin], 100
		jge _count_hundred
		cmp dword [inventory.coin], 10
		jge _count_ten
		cmp dword [inventory.coin], 1
		jge _count_one
		jmp _convert_coin_hundred_thousand
		_count_hundred_thousand:
			sub dword [inventory.coin], 100000
			add dword [decimal.hundred_thousand], 1
			jmp _coin_to_decimal
		_count_ten_thousand:
			sub dword [inventory.coin], 10000
			add dword [decimal.ten_thousand], 1
			jmp _coin_to_decimal
		_count_thousand:
			sub dword [inventory.coin], 1000
			add dword [decimal.thousand], 1
			jmp _coin_to_decimal
		_count_hundred:
			sub dword [inventory.coin], 100
			add dword [decimal.hundred], 1
			jmp _coin_to_decimal
		_count_ten:
			sub dword [inventory.coin], 10
			add dword [decimal.ten], 1
			jmp _coin_to_decimal
		_count_one:
			sub dword [inventory.coin], 1
			add dword [decimal.one], 1
			jmp _coin_to_decimal
	_convert_coin_hundred_thousand:
	cmp dword [decimal.hundred_thousand], 0
	je _hundred_thousand_zero
	cmp dword [decimal.hundred_thousand], 1
	je _hundred_thousand_one
	cmp dword [decimal.hundred_thousand], 2
	je _hundred_thousand_two
	cmp dword [decimal.hundred_thousand], 3
	je _hundred_thousand_three
	cmp dword [decimal.hundred_thousand], 4
	je _hundred_thousand_four
	cmp dword [decimal.hundred_thousand], 5
	je _hundred_thousand_five
	cmp dword [decimal.hundred_thousand], 6
	je _hundred_thousand_six
	cmp dword [decimal.hundred_thousand], 7
	je _hundred_thousand_seven
	cmp dword [decimal.hundred_thousand], 8
	je _hundred_thousand_eight
	cmp dword [decimal.hundred_thousand], 9
	je _hundred_thousand_nine
	_hundred_thousand_zero:
		mov dword [ui_rect.x], 215
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.zero]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _convert_coin_ten_thousand
	_hundred_thousand_one:
		mov dword [ui_rect.x], 215
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.one]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _convert_coin_ten_thousand
	_hundred_thousand_two:
		mov dword [ui_rect.x], 215
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.two]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _convert_coin_ten_thousand
	_hundred_thousand_three:
		mov dword [ui_rect.x], 215
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.three]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _convert_coin_ten_thousand
	_hundred_thousand_four:
		mov dword [ui_rect.x], 215
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.four]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _convert_coin_ten_thousand
	_hundred_thousand_five:
		mov dword [ui_rect.x], 215
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.five]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _convert_coin_ten_thousand
	_hundred_thousand_six:
		mov dword [ui_rect.x], 215
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.six]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _convert_coin_ten_thousand
	_hundred_thousand_seven:
		mov dword [ui_rect.x], 215
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.seven]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _convert_coin_ten_thousand
	_hundred_thousand_eight:
		mov dword [ui_rect.x], 215
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.eight]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _convert_coin_ten_thousand
	_hundred_thousand_nine:
		mov dword [ui_rect.x], 215
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.nine]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _convert_coin_ten_thousand
	_convert_coin_ten_thousand:
	cmp dword [decimal.ten_thousand], 0
	je _ten_thousand_zero
	cmp dword [decimal.ten_thousand], 1
	je _ten_thousand_one
	cmp dword [decimal.ten_thousand], 2
	je _ten_thousand_two
	cmp dword [decimal.ten_thousand], 3
	je _ten_thousand_three
	cmp dword [decimal.ten_thousand], 4
	je _ten_thousand_four
	cmp dword [decimal.ten_thousand], 5
	je _ten_thousand_five
	cmp dword [decimal.ten_thousand], 6
	je _ten_thousand_six
	cmp dword [decimal.ten_thousand], 7
	je _ten_thousand_seven
	cmp dword [decimal.ten_thousand], 8
	je _ten_thousand_eight
	cmp dword [decimal.ten_thousand], 9
	je _ten_thousand_nine
	_ten_thousand_zero:
		mov dword [ui_rect.x], 315
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.zero]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _convert_coin_thousand
	_ten_thousand_one:
		mov dword [ui_rect.x], 315
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.one]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _convert_coin_thousand
	_ten_thousand_two:
		mov dword [ui_rect.x], 315
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.two]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _convert_coin_thousand
	_ten_thousand_three:
		mov dword [ui_rect.x], 315
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.three]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _convert_coin_thousand
	_ten_thousand_four:
		mov dword [ui_rect.x], 315
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.four]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _convert_coin_thousand
	_ten_thousand_five:
		mov dword [ui_rect.x], 315
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.five]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _convert_coin_thousand
	_ten_thousand_six:
		mov dword [ui_rect.x], 315
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.six]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _convert_coin_thousand
	_ten_thousand_seven:
		mov dword [ui_rect.x], 315
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.seven]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _convert_coin_thousand
	_ten_thousand_eight:
		mov dword [ui_rect.x], 315
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.eight]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _convert_coin_thousand
	_ten_thousand_nine:
		mov dword [ui_rect.x], 315
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.nine]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _convert_coin_thousand
	_convert_coin_thousand:
	cmp dword [decimal.thousand], 0
	je _thousand_zero
	cmp dword [decimal.thousand], 1
	je _thousand_one
	cmp dword [decimal.thousand], 2
	je _thousand_two
	cmp dword [decimal.thousand], 3
	je _thousand_three
	cmp dword [decimal.thousand], 4
	je _thousand_four
	cmp dword [decimal.thousand], 5
	je _thousand_five
	cmp dword [decimal.thousand], 6
	je _thousand_six
	cmp dword [decimal.thousand], 7
	je _thousand_seven
	cmp dword [decimal.thousand], 8
	je _thousand_eight
	cmp dword [decimal.thousand], 9
	je _thousand_nine
	_thousand_zero:
		mov dword [ui_rect.x], 415
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.zero]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _convert_coin_hundred
	_thousand_one:
		mov dword [ui_rect.x], 415
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.one]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _convert_coin_hundred
	_thousand_two:
		mov dword [ui_rect.x], 415
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.two]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _convert_coin_hundred
	_thousand_three:
		mov dword [ui_rect.x], 415
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.three]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _convert_coin_hundred
	_thousand_four:
		mov dword [ui_rect.x], 415
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.four]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _convert_coin_hundred
	_thousand_five:
		mov dword [ui_rect.x], 415
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.five]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _convert_coin_hundred
	_thousand_six:
		mov dword [ui_rect.x], 415
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.six]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _convert_coin_hundred
	_thousand_seven:
		mov dword [ui_rect.x], 415
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.seven]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _convert_coin_hundred
	_thousand_eight:
		mov dword [ui_rect.x], 415
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.eight]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _convert_coin_hundred
	_thousand_nine:
		mov dword [ui_rect.x], 415
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.nine]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _convert_coin_hundred
	_convert_coin_hundred:
	cmp dword [decimal.hundred], 0
	je _hundred_zero
	cmp dword [decimal.hundred], 1
	je _hundred_one
	cmp dword [decimal.hundred], 2
	je _hundred_two
	cmp dword [decimal.hundred], 3
	je _hundred_three
	cmp dword [decimal.hundred], 4
	je _hundred_four
	cmp dword [decimal.hundred], 5
	je _hundred_five
	cmp dword [decimal.hundred], 6
	je _hundred_six
	cmp dword [decimal.hundred], 7
	je _hundred_seven
	cmp dword [decimal.hundred], 8
	je _hundred_eight
	cmp dword [decimal.hundred], 9
	je _hundred_nine
	_hundred_zero:
		mov dword [ui_rect.x], 515
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.zero]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _convert_coin_ten
	_hundred_one:
		mov dword [ui_rect.x], 515
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.one]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _convert_coin_ten
	_hundred_two:
		mov dword [ui_rect.x], 515
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.two]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _convert_coin_ten
	_hundred_three:
		mov dword [ui_rect.x], 515
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.three]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _convert_coin_ten
	_hundred_four:
		mov dword [ui_rect.x], 515
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.four]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _convert_coin_ten
	_hundred_five:
		mov dword [ui_rect.x], 515
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.five]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _convert_coin_ten
	_hundred_six:
		mov dword [ui_rect.x], 515
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.six]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _convert_coin_ten
	_hundred_seven:
		mov dword [ui_rect.x], 515
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.seven]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _convert_coin_ten
	_hundred_eight:
		mov dword [ui_rect.x], 515
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.eight]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _convert_coin_ten
	_hundred_nine:
		mov dword [ui_rect.x], 515
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.nine]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _convert_coin_ten
	_convert_coin_ten:
	cmp dword [decimal.ten], 0
	je _ten_zero
	cmp dword [decimal.ten], 1
	je _ten_one
	cmp dword [decimal.ten], 2
	je _ten_two
	cmp dword [decimal.ten], 3
	je _ten_three
	cmp dword [decimal.ten], 4
	je _ten_four
	cmp dword [decimal.ten], 5
	je _ten_five
	cmp dword [decimal.ten], 6
	je _ten_six
	cmp dword [decimal.ten], 7
	je _ten_seven
	cmp dword [decimal.ten], 8
	je _ten_eight
	cmp dword [decimal.ten], 9
	je _ten_nine
	_ten_zero:
		mov dword [ui_rect.x], 615
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.zero]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _convert_coin_one
	_ten_one:
		mov dword [ui_rect.x], 615
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.one]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _convert_coin_one
	_ten_two:
		mov dword [ui_rect.x], 615
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.two]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _convert_coin_one
	_ten_three:
		mov dword [ui_rect.x], 615
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.three]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _convert_coin_one
	_ten_four:
		mov dword [ui_rect.x], 615
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.four]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _convert_coin_one
	_ten_five:
		mov dword [ui_rect.x], 615
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.five]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _convert_coin_one
	_ten_six:
		mov dword [ui_rect.x], 615
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.six]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _convert_coin_one
	_ten_seven:
		mov dword [ui_rect.x], 615
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.seven]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _convert_coin_one
	_ten_eight:
		mov dword [ui_rect.x], 615
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.eight]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _convert_coin_one
	_ten_nine:
		mov dword [ui_rect.x], 615
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.nine]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _convert_coin_one
	_convert_coin_one:
	cmp dword [decimal.one], 0
	je _one_zero
	cmp dword [decimal.one], 1
	je _one_one
	cmp dword [decimal.one], 2
	je _one_two
	cmp dword [decimal.one], 3
	je _one_three
	cmp dword [decimal.one], 4
	je _one_four
	cmp dword [decimal.one], 5
	je _one_five
	cmp dword [decimal.one], 6
	je _one_six
	cmp dword [decimal.one], 7
	je _one_seven
	cmp dword [decimal.one], 8
	je _one_eight
	cmp dword [decimal.one], 9
	je _one_nine
	_one_zero:
		mov dword [ui_rect.x], 715
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.zero]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _done_convert_coin
	_one_one:
		mov dword [ui_rect.x], 715
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.one]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _done_convert_coin
	_one_two:
		mov dword [ui_rect.x], 715
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.two]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _done_convert_coin
	_one_three:
		mov dword [ui_rect.x], 715
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.three]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _done_convert_coin
	_one_four:
		mov dword [ui_rect.x], 715
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.four]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _done_convert_coin
	_one_five:
		mov dword [ui_rect.x], 715
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.five]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _done_convert_coin
	_one_six:
		mov dword [ui_rect.x], 715
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.six]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _done_convert_coin
	_one_seven:
		mov dword [ui_rect.x], 715
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.seven]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _done_convert_coin
	_one_eight:
		mov dword [ui_rect.x], 715
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.eight]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _done_convert_coin
	_one_nine:
		mov dword [ui_rect.x], 715
		mov dword [ui_rect.y], 0
		mov dword [ui_rect.w], 100
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.nine]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		jmp _done_convert_coin
	_done_convert_coin:
	mov dword [inventory.coin], ebx
	
	;draw blank inventory slots
	mov dword [ui_rect.x], 1600
	mov dword [ui_rect.y], 0
	mov dword [ui_rect.w], 281
	mov dword [ui_rect.h], 290
	push ui_rect
	push NULL
	push dword [texture.inventory]
	push dword [renderer]
	call _SDL_RenderCopy
	add esp, 4*4
	
	mov dword [ui_rect.x], 1600
	mov dword [ui_rect.y], 290
	mov dword [ui_rect.w], 281
	mov dword [ui_rect.h], 290
	push ui_rect
	push NULL
	push dword [texture.inventory]
	push dword [renderer]
	call _SDL_RenderCopy
	add esp, 4*4
	
	mov dword [ui_rect.x], 1600
	mov dword [ui_rect.y], 580
	mov dword [ui_rect.w], 281
	mov dword [ui_rect.h], 290
	push ui_rect
	push NULL
	push dword [texture.inventory]
	push dword [renderer]
	call _SDL_RenderCopy
	add esp, 4*4
	
	;draw hearts
	cmp dword [health], 15
	je _draw_15_health
	cmp dword [health], 14
	je _draw_14_health
	cmp dword [health], 13
	je _draw_13_health
	cmp dword [health], 12
	je _draw_12_health
	cmp dword [health], 11
	je _draw_11_health
	cmp dword [health], 10
	je _draw_10_health
	cmp dword [health], 9
	je _draw_9_health
	cmp dword [health], 8
	je _draw_8_health
	cmp dword [health], 7
	je _draw_7_health
	cmp dword [health], 6
	je _draw_6_health
	cmp dword [health], 5
	je _draw_5_health
	cmp dword [health], 4
	je _draw_4_health
	cmp dword [health], 3
	je _draw_3_health
	cmp dword [health], 2
	je _draw_2_health
	cmp dword [health], 1
	je _draw_1_health
	cmp dword [health], 0
	je _draw_0_health
	
	ret
	
	_draw_15_health:
		mov dword [ui_rect.x], 0
		mov dword [ui_rect.y], 300
		mov dword [ui_rect.w], 200
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.heart5of5]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
	
		mov dword [ui_rect.x], 0
		mov dword [ui_rect.y], 500
		mov dword [ui_rect.w], 200
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.heart5of5]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
	
		mov dword [ui_rect.x], 0
		mov dword [ui_rect.y], 700
		mov dword [ui_rect.w], 200
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.heart5of5]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		
		ret
	
	_draw_14_health:
		mov dword [ui_rect.x], 0
		mov dword [ui_rect.y], 300
		mov dword [ui_rect.w], 200
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.heart5of5]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
	
		mov dword [ui_rect.x], 0
		mov dword [ui_rect.y], 500
		mov dword [ui_rect.w], 200
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.heart5of5]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
	
		mov dword [ui_rect.x], 0
		mov dword [ui_rect.y], 700
		mov dword [ui_rect.w], 200
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.heart4of5]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		
		ret
		
	_draw_13_health:
		mov dword [ui_rect.x], 0
		mov dword [ui_rect.y], 300
		mov dword [ui_rect.w], 200
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.heart5of5]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
	
		mov dword [ui_rect.x], 0
		mov dword [ui_rect.y], 500
		mov dword [ui_rect.w], 200
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.heart5of5]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
	
		mov dword [ui_rect.x], 0
		mov dword [ui_rect.y], 700
		mov dword [ui_rect.w], 200
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.heart3of5]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		
		ret
	
	_draw_12_health:
		mov dword [ui_rect.x], 0
		mov dword [ui_rect.y], 300
		mov dword [ui_rect.w], 200
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.heart5of5]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
	
		mov dword [ui_rect.x], 0
		mov dword [ui_rect.y], 500
		mov dword [ui_rect.w], 200
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.heart5of5]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
	
		mov dword [ui_rect.x], 0
		mov dword [ui_rect.y], 700
		mov dword [ui_rect.w], 200
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.heart2of5]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		
		ret
	
	_draw_11_health:
		mov dword [ui_rect.x], 0
		mov dword [ui_rect.y], 300
		mov dword [ui_rect.w], 200
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.heart5of5]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
	
		mov dword [ui_rect.x], 0
		mov dword [ui_rect.y], 500
		mov dword [ui_rect.w], 200
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.heart5of5]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
	
		mov dword [ui_rect.x], 0
		mov dword [ui_rect.y], 700
		mov dword [ui_rect.w], 200
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.heart1of5]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		
		ret
		
	_draw_10_health:
		mov dword [ui_rect.x], 0
		mov dword [ui_rect.y], 300
		mov dword [ui_rect.w], 200
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.heart5of5]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
	
		mov dword [ui_rect.x], 0
		mov dword [ui_rect.y], 500
		mov dword [ui_rect.w], 200
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.heart5of5]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
	
		mov dword [ui_rect.x], 0
		mov dword [ui_rect.y], 700
		mov dword [ui_rect.w], 200
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.heart0of5]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		
		ret
		
	_draw_9_health:
		mov dword [ui_rect.x], 0
		mov dword [ui_rect.y], 300
		mov dword [ui_rect.w], 200
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.heart5of5]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
	
		mov dword [ui_rect.x], 0
		mov dword [ui_rect.y], 500
		mov dword [ui_rect.w], 200
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.heart4of5]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
	
		mov dword [ui_rect.x], 0
		mov dword [ui_rect.y], 700
		mov dword [ui_rect.w], 200
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.heart0of5]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		
		ret
		
	_draw_8_health:
		mov dword [ui_rect.x], 0
		mov dword [ui_rect.y], 300
		mov dword [ui_rect.w], 200
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.heart5of5]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
	
		mov dword [ui_rect.x], 0
		mov dword [ui_rect.y], 500
		mov dword [ui_rect.w], 200
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.heart3of5]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
	
		mov dword [ui_rect.x], 0
		mov dword [ui_rect.y], 700
		mov dword [ui_rect.w], 200
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.heart0of5]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		
		ret
		
	_draw_7_health:
		mov dword [ui_rect.x], 0
		mov dword [ui_rect.y], 300
		mov dword [ui_rect.w], 200
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.heart5of5]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
	
		mov dword [ui_rect.x], 0
		mov dword [ui_rect.y], 500
		mov dword [ui_rect.w], 200
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.heart2of5]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
	
		mov dword [ui_rect.x], 0
		mov dword [ui_rect.y], 700
		mov dword [ui_rect.w], 200
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.heart0of5]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		
		ret
		
	_draw_6_health:
		mov dword [ui_rect.x], 0
		mov dword [ui_rect.y], 300
		mov dword [ui_rect.w], 200
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.heart5of5]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
	
		mov dword [ui_rect.x], 0
		mov dword [ui_rect.y], 500
		mov dword [ui_rect.w], 200
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.heart1of5]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
	
		mov dword [ui_rect.x], 0
		mov dword [ui_rect.y], 700
		mov dword [ui_rect.w], 200
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.heart0of5]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		
		ret
		
	_draw_5_health:
		mov dword [ui_rect.x], 0
		mov dword [ui_rect.y], 300
		mov dword [ui_rect.w], 200
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.heart5of5]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
	
		mov dword [ui_rect.x], 0
		mov dword [ui_rect.y], 500
		mov dword [ui_rect.w], 200
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.heart0of5]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
	
		mov dword [ui_rect.x], 0
		mov dword [ui_rect.y], 700
		mov dword [ui_rect.w], 200
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.heart0of5]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		
		ret
		
	_draw_4_health:
		mov dword [ui_rect.x], 0
		mov dword [ui_rect.y], 300
		mov dword [ui_rect.w], 200
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.heart4of5]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
	
		mov dword [ui_rect.x], 0
		mov dword [ui_rect.y], 500
		mov dword [ui_rect.w], 200
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.heart0of5]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
	
		mov dword [ui_rect.x], 0
		mov dword [ui_rect.y], 700
		mov dword [ui_rect.w], 200
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.heart0of5]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		
		ret
		
	_draw_3_health:
		mov dword [ui_rect.x], 0
		mov dword [ui_rect.y], 300
		mov dword [ui_rect.w], 200
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.heart3of5]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
	
		mov dword [ui_rect.x], 0
		mov dword [ui_rect.y], 500
		mov dword [ui_rect.w], 200
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.heart0of5]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
	
		mov dword [ui_rect.x], 0
		mov dword [ui_rect.y], 700
		mov dword [ui_rect.w], 200
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.heart0of5]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		
		ret
		
	_draw_2_health:
		mov dword [ui_rect.x], 0
		mov dword [ui_rect.y], 300
		mov dword [ui_rect.w], 200
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.heart2of5]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
	
		mov dword [ui_rect.x], 0
		mov dword [ui_rect.y], 500
		mov dword [ui_rect.w], 200
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.heart0of5]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
	
		mov dword [ui_rect.x], 0
		mov dword [ui_rect.y], 700
		mov dword [ui_rect.w], 200
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.heart0of5]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		
		ret
		
	_draw_1_health:
		mov dword [ui_rect.x], 0
		mov dword [ui_rect.y], 300
		mov dword [ui_rect.w], 200
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.heart1of5]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
	
		mov dword [ui_rect.x], 0
		mov dword [ui_rect.y], 500
		mov dword [ui_rect.w], 200
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.heart0of5]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
	
		mov dword [ui_rect.x], 0
		mov dword [ui_rect.y], 700
		mov dword [ui_rect.w], 200
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.heart0of5]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		
		ret
		
	_draw_0_health:
		mov dword [ui_rect.x], 0
		mov dword [ui_rect.y], 300
		mov dword [ui_rect.w], 200
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.heart0of5]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
	
		mov dword [ui_rect.x], 0
		mov dword [ui_rect.y], 500
		mov dword [ui_rect.w], 200
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.heart0of5]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
	
		mov dword [ui_rect.x], 0
		mov dword [ui_rect.y], 700
		mov dword [ui_rect.w], 200
		mov dword [ui_rect.h], 200
		push ui_rect
		push NULL
		push dword [texture.heart0of5]
		push dword [renderer]
		call _SDL_RenderCopy
		add esp, 4*4
		
		ret