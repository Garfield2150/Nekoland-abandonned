camera_speed equ 1

_camera:
	cmp dword [neko_rect.y], 340
	jl _follow_neko_up
	jg _follow_neko_down
	cmp dword [neko_rect.x], 720
	jl _follow_neko_left
	jg _follow_neko_right
	ret
	_follow_neko_up:
		add dword [neko_rect.y], camera_speed
		add dword [image_rect.y], camera_speed
		ret
	_follow_neko_down:
		sub dword [neko_rect.y], camera_speed
		sub dword [image_rect.y], camera_speed
		ret
	_follow_neko_left:
		add dword [neko_rect.x], camera_speed
		add dword [image_rect.x], camera_speed
		ret
	_follow_neko_right:
		sub dword [neko_rect.x], camera_speed
		sub dword [image_rect.x], camera_speed
		ret