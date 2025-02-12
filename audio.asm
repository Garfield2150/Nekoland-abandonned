section .data
	;sounds' path
	pop: db "Assets/sounds/pop.wav", 0

section .bss use32
	audio:
		.pop: resb 4

section .text

_load_audio:
	
	
	ret