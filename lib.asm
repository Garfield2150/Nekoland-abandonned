;architecture
cpu 386
bits 32

;c library
extern _printf
extern _fopen
extern _fwrite
extern _fread

;SDL for creating window
extern _SDL_Init

;for window
extern _SDL_CreateWindow
extern _SDL_SetWindowFullscreen
extern _SDL_DestroyWindow

;for renderer
extern _SDL_CreateRenderer
extern _SDL_SetRenderDrawColor
extern _SDL_RenderPresent
extern _SDL_RenderCopy
extern _SDL_RenderClear
extern _SDL_DestroyRenderer

;other things
extern _SDL_Quit
extern _SDL_PollEvent
extern _SDL_Delay
extern _SDL_GetError

;read keyboard and mouse
extern _SDL_GetKeyboardState
extern _SDL_GetMouseState

;SDL image
extern _IMG_Init
extern _IMG_LoadTexture
extern _SDL_QueryTexture
extern _SDL_DestroyTexture
extern _IMG_Quit

;SDL ttf


;custom mouse
extern _SDL_GetMouseState
extern _SDL_SetCursor
extern _SDL_ShowCursor

;SDL constants
NULL equ 0
true equ 1
false equ 0
SDL_WINDOW_FULLSCREEN equ 1
SDL_INIT_VIDEO equ 32
SDL_INIT_AUDIO equ 16
SDL_INIT_EVENTS equ 16384
SDL_INIT_JOYSTICK equ 512
SDL_INIT_HAPTIC equ 4096
SDL_INIT_GAMECONTROLLER equ 8192
SDL_INIT_NOPARACHUTE equ 1048576
SDL_INIT_TIMER equ 1
SDL_INIT_EVERYTHING equ SDL_INIT_VIDEO\
					   +SDL_INIT_AUDIO\
					   +SDL_INIT_EVENTS\
					   +SDL_INIT_JOYSTICK\
					   +SDL_INIT_HAPTIC\
					   +SDL_INIT_GAMECONTROLLER\
					   +SDL_INIT_NOPARACHUTE\
					   +SDL_INIT_TIMER

SDL_RENDERER_ACCELERATED equ 2
SDL_RENDERER_PRESENTVSYNC equ 4
SDL_WINDOW_SHOWN equ 4
SDL_WINDOWPOS_CENTERED_MASK equ 805240832
SDL_QUIT equ 256
SDL_KEYDOWN equ 768
IMG_INIT_PNG equ 2

;SDL scancode
SDL_SCANCODE_RIGHT equ 79
SDL_SCANCODE_LEFT equ 80
SDL_SCANCODE_DOWN equ 81
SDL_SCANCODE_UP equ 82
SDL_SCANCODE_ESCAPE equ 41
SDL_SCANCODE_LSHIFT equ 225
SDL_SCANCODE_F11 equ 68
SDL_SCANCODE_SPACE equ 44