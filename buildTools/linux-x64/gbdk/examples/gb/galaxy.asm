;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.4 #11952 (Linux)
;--------------------------------------------------------
	.module galaxy
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _set_sprite_data
	.globl _set_win_tiles
	.globl _set_win_data
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _display_off
	.globl _wait_vbl_done
	.globl _disable_interrupts
	.globl _enable_interrupts
	.globl _joypad
	.globl _sspy
	.globl _sspx
	.globl _sposy
	.globl _sposx
	.globl _wspy
	.globl _wspx
	.globl _wposy
	.globl _wposx
	.globl _bspy
	.globl _bspx
	.globl _bposy
	.globl _bposx
	.globl _sframe
	.globl _doorpos
	.globl _doorstate
	.globl _film
	.globl _door4_tiles
	.globl _door3_tiles
	.globl _door2_tiles
	.globl _door1_tiles
	.globl _frame_tiles
	.globl _earth_tiles
	.globl _bkg_tiles
	.globl _bkg_data
	.globl _frame_data
	.globl _earth_data
	.globl _std_data
	.globl _fade
	.globl _scroll
	.globl _door
	.globl _animate_sprite
	.globl _tile_sprite
	.globl _place_sprite
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_time:
	.ds 1
_doorstate::
	.ds 1
_doorpos::
	.ds 1
_color:
	.ds 1
_sframe::
	.ds 1
_bposx::
	.ds 2
_bposy::
	.ds 2
_bspx::
	.ds 2
_bspy::
	.ds 2
_wposx::
	.ds 2
_wposy::
	.ds 2
_wspx::
	.ds 2
_wspy::
	.ds 2
_sposx::
	.ds 2
_sposy::
	.ds 2
_sspx::
	.ds 2
_sspy::
	.ds 2
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;galaxy.c:389: void fade()
;	---------------------------------
; Function fade
; ---------------------------------
_fade::
;galaxy.c:391: if(color == 0)
	ld	a, (#_color)
	or	a, a
;galaxy.c:392: return;
	ret	Z
;galaxy.c:393: switch(color)
	ld	a, (#_color)
	sub	a, #0x10
	jr	Z, 00108$
	ld	a, (#_color)
	sub	a, #0x20
	jr	Z, 00104$
	ld	a, (#_color)
	sub	a, #0x30
	jr	Z, 00106$
	ld	a, (#_color)
	sub	a, #0x40
	jr	Z, 00107$
	ld	a, (#_color)
	sub	a, #0x50
	jr	Z, 00106$
	ld	a, (#_color)
	sub	a, #0x60
	jr	NZ, 00109$
;galaxy.c:396: case STARTFADE-4*FADESTEP:
00104$:
;galaxy.c:397: BGP_REG = 0xF9U;
	ld	a, #0xf9
	ldh	(_BGP_REG+0),a
;galaxy.c:398: break;
	jr	00109$
;galaxy.c:400: case STARTFADE-3*FADESTEP:
00106$:
;galaxy.c:401: BGP_REG = 0xFEU;
	ld	a, #0xfe
	ldh	(_BGP_REG+0),a
;galaxy.c:402: break;
	jr	00109$
;galaxy.c:403: case STARTFADE-2*FADESTEP:
00107$:
;galaxy.c:404: BGP_REG = 0xFFU;
	ld	a, #0xff
	ldh	(_BGP_REG+0),a
;galaxy.c:405: break;
	jr	00109$
;galaxy.c:406: case STARTFADE-5*FADESTEP:
00108$:
;galaxy.c:407: BGP_REG = 0xE4U;
	ld	a, #0xe4
	ldh	(_BGP_REG+0),a
;galaxy.c:409: }
00109$:
;galaxy.c:410: color--;
	ld	hl, #_color
	dec	(hl)
;galaxy.c:411: }
	ret
_std_data:
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_earth_data:
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x18	; 24
	.db #0x1f	; 31
	.db #0x32	; 50	'2'
	.db #0x2d	; 45
	.db #0x71	; 113	'q'
	.db #0x4e	; 78	'N'
	.db #0x70	; 112	'p'
	.db #0x4f	; 79	'O'
	.db #0xf8	; 248
	.db #0x87	; 135
	.db #0xf8	; 248
	.db #0x87	; 135
	.db #0xf8	; 248
	.db #0x87	; 135
	.db #0xfc	; 252
	.db #0x83	; 131
	.db #0xfe	; 254
	.db #0x81	; 129
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x1f	; 31
	.db #0x18	; 24
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xf0	; 240
	.db #0x30	; 48	'0'
	.db #0x78	; 120	'x'
	.db #0x88	; 136
	.db #0x3c	; 60
	.db #0xc4	; 196
	.db #0x5c	; 92
	.db #0xa4	; 164
	.db #0x9e	; 158
	.db #0x62	; 98	'b'
	.db #0x3e	; 62
	.db #0xc2	; 194
	.db #0x3e	; 62
	.db #0xc2	; 194
	.db #0x5e	; 94
	.db #0xa2	; 162
	.db #0x7e	; 126
	.db #0x82	; 130
	.db #0x0c	; 12
	.db #0xf4	; 244
	.db #0x0c	; 12
	.db #0xf4	; 244
	.db #0x98	; 152
	.db #0x68	; 104	'h'
	.db #0xb0	; 176
	.db #0x70	; 112	'p'
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x1f	; 31
	.db #0x18	; 24
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x4f	; 79	'O'
	.db #0x70	; 112	'p'
	.db #0x6f	; 111	'o'
	.db #0x50	; 80	'P'
	.db #0x9f	; 159
	.db #0xe0	; 224
	.db #0x9f	; 159
	.db #0xe0	; 224
	.db #0xbf	; 191
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xb7	; 183
	.db #0xc8	; 200
	.db #0x63	; 99	'c'
	.db #0x5c	; 92
	.db #0x43	; 67	'C'
	.db #0x7c	; 124
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x1f	; 31
	.db #0x18	; 24
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xb0	; 176
	.db #0x70	; 112	'p'
	.db #0x18	; 24
	.db #0xe8	; 232
	.db #0x0c	; 12
	.db #0xf4	; 244
	.db #0x0c	; 12
	.db #0xf4	; 244
	.db #0x82	; 130
	.db #0x7e	; 126
	.db #0x82	; 130
	.db #0x7e	; 126
	.db #0x86	; 134
	.db #0x7a	; 122	'z'
	.db #0xc6	; 198
	.db #0x3a	; 58
	.db #0xe6	; 230
	.db #0x1a	; 26
	.db #0xf4	; 244
	.db #0x0c	; 12
	.db #0xfc	; 252
	.db #0x04	; 4
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0xf0	; 240
	.db #0x30	; 48	'0'
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x1e	; 30
	.db #0x19	; 25
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x42	; 66	'B'
	.db #0x7d	; 125
	.db #0x81	; 129
	.db #0xfe	; 254
	.db #0x81	; 129
	.db #0xfe	; 254
	.db #0x83	; 131
	.db #0xfc	; 252
	.db #0xd7	; 215
	.db #0xa8	; 168
	.db #0xbb	; 187
	.db #0xc4	; 196
	.db #0x6e	; 110	'n'
	.db #0x51	; 81	'Q'
	.db #0x7c	; 124
	.db #0x43	; 67	'C'
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x1f	; 31
	.db #0x18	; 24
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x70	; 112	'p'
	.db #0xb0	; 176
	.db #0xe8	; 232
	.db #0x18	; 24
	.db #0xf4	; 244
	.db #0x0c	; 12
	.db #0xf4	; 244
	.db #0x0c	; 12
	.db #0xfe	; 254
	.db #0x02	; 2
	.db #0xfe	; 254
	.db #0x02	; 2
	.db #0xfe	; 254
	.db #0x02	; 2
	.db #0xfe	; 254
	.db #0x02	; 2
	.db #0x7e	; 126
	.db #0x82	; 130
	.db #0x3c	; 60
	.db #0xc4	; 196
	.db #0x3c	; 60
	.db #0xc4	; 196
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0xf0	; 240
	.db #0x30	; 48	'0'
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x1b	; 27
	.db #0x1c	; 28
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0xe0	; 224
	.db #0x9f	; 159
	.db #0x90	; 144
	.db #0xef	; 239
	.db #0x89	; 137
	.db #0xf6	; 246
	.db #0x8d	; 141
	.db #0xf2	; 242
	.db #0x9f	; 159
	.db #0xe0	; 224
	.db #0x5e	; 94
	.db #0x61	; 97	'a'
	.db #0x6f	; 111	'o'
	.db #0x50	; 80	'P'
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x1f	; 31
	.db #0x18	; 24
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xb0	; 176
	.db #0x70	; 112	'p'
	.db #0x28	; 40
	.db #0xd8	; 216
	.db #0x04	; 4
	.db #0xfc	; 252
	.db #0x2c	; 44
	.db #0xd4	; 212
	.db #0x1e	; 30
	.db #0xe2	; 226
	.db #0x1e	; 30
	.db #0xe2	; 226
	.db #0x3e	; 62
	.db #0xc2	; 194
	.db #0x7e	; 126
	.db #0x82	; 130
	.db #0xb6	; 182
	.db #0x4a	; 74	'J'
	.db #0xe4	; 228
	.db #0x1c	; 28
	.db #0xc4	; 196
	.db #0x3c	; 60
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0xf0	; 240
	.db #0x30	; 48	'0'
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x18	; 24
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0xee	; 238
	.db #0x91	; 145
	.db #0xf1	; 241
	.db #0x8e	; 142
	.db #0xe0	; 224
	.db #0x9f	; 159
	.db #0xe0	; 224
	.db #0x9f	; 159
	.db #0xf1	; 241
	.db #0x8e	; 142
	.db #0x71	; 113	'q'
	.db #0x4e	; 78	'N'
	.db #0x72	; 114	'r'
	.db #0x4d	; 77	'M'
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x1f	; 31
	.db #0x18	; 24
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xf0	; 240
	.db #0x30	; 48	'0'
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x04	; 4
	.db #0xfc	; 252
	.db #0x04	; 4
	.db #0xfc	; 252
	.db #0x02	; 2
	.db #0xfe	; 254
	.db #0x02	; 2
	.db #0xfe	; 254
	.db #0x92	; 146
	.db #0x6e	; 110	'n'
	.db #0xd6	; 214
	.db #0x2a	; 42
	.db #0xfe	; 254
	.db #0x02	; 2
	.db #0xec	; 236
	.db #0x14	; 20
	.db #0xfc	; 252
	.db #0x04	; 4
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0xf0	; 240
	.db #0x30	; 48	'0'
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x1d	; 29
	.db #0x1a	; 26
	.db #0x36	; 54	'6'
	.db #0x29	; 41
	.db #0x5c	; 92
	.db #0x63	; 99	'c'
	.db #0x6c	; 108	'l'
	.db #0x53	; 83	'S'
	.db #0xce	; 206
	.db #0xb1	; 177
	.db #0x9f	; 159
	.db #0xe0	; 224
	.db #0x9e	; 158
	.db #0xe1	; 225
	.db #0xae	; 174
	.db #0xd1	; 209
	.db #0xbf	; 191
	.db #0xc0	; 192
	.db #0x47	; 71	'G'
	.db #0x78	; 120	'x'
	.db #0x47	; 71	'G'
	.db #0x78	; 120	'x'
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x1f	; 31
	.db #0x18	; 24
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x70	; 112	'p'
	.db #0xb0	; 176
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x04	; 4
	.db #0xfc	; 252
	.db #0x04	; 4
	.db #0xfc	; 252
	.db #0xe2	; 226
	.db #0x1e	; 30
	.db #0x32	; 50	'2'
	.db #0xce	; 206
	.db #0x0e	; 14
	.db #0xf2	; 242
	.db #0x0e	; 14
	.db #0xf2	; 242
	.db #0x1e	; 30
	.db #0xe2	; 226
	.db #0x1c	; 28
	.db #0xe4	; 228
	.db #0x2c	; 44
	.db #0xd4	; 212
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0xf0	; 240
	.db #0x30	; 48	'0'
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x1e	; 30
	.db #0x19	; 25
	.db #0x33	; 51	'3'
	.db #0x2c	; 44
	.db #0x49	; 73	'I'
	.db #0x76	; 118	'v'
	.db #0x42	; 66	'B'
	.db #0x7d	; 125
	.db #0xc4	; 196
	.db #0xbb	; 187
	.db #0xc1	; 193
	.db #0xbe	; 190
	.db #0xc1	; 193
	.db #0xbe	; 190
	.db #0xe2	; 226
	.db #0x9d	; 157
	.db #0xf3	; 243
	.db #0x8c	; 140
	.db #0x78	; 120	'x'
	.db #0x47	; 71	'G'
	.db #0x78	; 120	'x'
	.db #0x47	; 71	'G'
	.db #0x3c	; 60
	.db #0x23	; 35
	.db #0x1c	; 28
	.db #0x1b	; 27
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x70	; 112	'p'
	.db #0xb0	; 176
	.db #0x68	; 104	'h'
	.db #0x98	; 152
	.db #0xc4	; 196
	.db #0x3c	; 60
	.db #0xc4	; 196
	.db #0x3c	; 60
	.db #0xee	; 238
	.db #0x12	; 18
	.db #0xf2	; 242
	.db #0x0e	; 14
	.db #0xe2	; 226
	.db #0x1e	; 30
	.db #0xe2	; 226
	.db #0x1e	; 30
	.db #0xf2	; 242
	.db #0x0e	; 14
	.db #0x7c	; 124
	.db #0x84	; 132
	.db #0x7c	; 124
	.db #0x84	; 132
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0xf0	; 240
	.db #0x30	; 48	'0'
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
_frame_data:
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x03	; 3
	.db #0xfc	; 252
	.db #0x07	; 7
	.db #0xf8	; 248
	.db #0x0f	; 15
	.db #0xf0	; 240
	.db #0x1f	; 31
	.db #0xe0	; 224
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0xf8	; 248
	.db #0x07	; 7
	.db #0xf0	; 240
	.db #0x0f	; 15
	.db #0xe0	; 224
	.db #0x1f	; 31
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xfd	; 253
	.db #0x03	; 3
	.db #0xf9	; 249
	.db #0x07	; 7
	.db #0xf1	; 241
	.db #0x0f	; 15
	.db #0xe1	; 225
	.db #0x1f	; 31
	.db #0xc1	; 193
	.db #0x3f	; 63
	.db #0x81	; 129
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x81	; 129
	.db #0x7e	; 126
	.db #0x83	; 131
	.db #0x7c	; 124
	.db #0x87	; 135
	.db #0x78	; 120	'x'
	.db #0x8f	; 143
	.db #0x70	; 112	'p'
	.db #0x9f	; 159
	.db #0x60	; 96
	.db #0xbf	; 191
	.db #0x40	; 64
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x70	; 112	'p'
	.db #0xff	; 255
	.db #0x98	; 152
	.db #0xef	; 239
	.db #0xb8	; 184
	.db #0xcf	; 207
	.db #0xf8	; 248
	.db #0xff	; 255
	.db #0x70	; 112	'p'
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0xf8	; 248
	.db #0x07	; 7
	.db #0xf0	; 240
	.db #0x0f	; 15
	.db #0xe0	; 224
	.db #0x1f	; 31
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x03	; 3
	.db #0xfc	; 252
	.db #0x07	; 7
	.db #0xf8	; 248
	.db #0x0f	; 15
	.db #0xf0	; 240
	.db #0x1f	; 31
	.db #0xe0	; 224
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x0e	; 14
	.db #0xff	; 255
	.db #0x13	; 19
	.db #0xfd	; 253
	.db #0x17	; 23
	.db #0xf9	; 249
	.db #0x1f	; 31
	.db #0xfe	; 254
	.db #0x0f	; 15
	.db #0xe0	; 224
	.db #0x1f	; 31
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xfd	; 253
	.db #0x03	; 3
	.db #0xf9	; 249
	.db #0x07	; 7
	.db #0xf1	; 241
	.db #0x0f	; 15
	.db #0xe1	; 225
	.db #0x1f	; 31
	.db #0xc1	; 193
	.db #0x3f	; 63
	.db #0x81	; 129
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0xfd	; 253
	.db #0x07	; 7
	.db #0xf9	; 249
	.db #0x0f	; 15
	.db #0xf1	; 241
	.db #0x1f	; 31
	.db #0xe1	; 225
	.db #0x3f	; 63
	.db #0xc1	; 193
	.db #0x7f	; 127
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x03	; 3
	.db #0xfc	; 252
	.db #0x77	; 119	'w'
	.db #0xf8	; 248
	.db #0xff	; 255
	.db #0x98	; 152
	.db #0xef	; 239
	.db #0xb8	; 184
	.db #0xcf	; 207
	.db #0xf8	; 248
	.db #0x7f	; 127
	.db #0xf0	; 240
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x0e	; 14
	.db #0xff	; 255
	.db #0x13	; 19
	.db #0xfd	; 253
	.db #0x17	; 23
	.db #0xf9	; 249
	.db #0x1f	; 31
	.db #0xff	; 255
	.db #0x0e	; 14
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x81	; 129
	.db #0x7e	; 126
	.db #0x83	; 131
	.db #0x7c	; 124
	.db #0x87	; 135
	.db #0x78	; 120	'x'
	.db #0x8f	; 143
	.db #0x70	; 112	'p'
	.db #0x9f	; 159
	.db #0x60	; 96
	.db #0xbf	; 191
	.db #0x40	; 64
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
_bkg_data:
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xdf	; 223
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfb	; 251
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf7	; 247
	.db #0xf7	; 247
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xdf	; 223
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf7	; 247
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xdf	; 223
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf7	; 247
	.db #0xff	; 255
	.db #0xfb	; 251
	.db #0xff	; 255
	.db #0xfd	; 253
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf7	; 247
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7d	; 125
	.db #0xfe	; 254
	.db #0x7c	; 124
	.db #0x39	; 57	'9'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf7	; 247
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xdf	; 223
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xdf	; 223
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfd	; 253
	.db #0xbb	; 187
	.db #0x01	; 1
	.db #0xc7	; 199
	.db #0x83	; 131
	.db #0xc7	; 199
	.db #0x83	; 131
	.db #0xc7	; 199
	.db #0x83	; 131
	.db #0xbb	; 187
	.db #0x01	; 1
	.db #0x7c	; 124
	.db #0x39	; 57	'9'
	.db #0x7d	; 125
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfd	; 253
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfd	; 253
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfd	; 253
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfb	; 251
	.db #0xaf	; 175
	.db #0x77	; 119	'w'
	.db #0x27	; 39
	.db #0x8f	; 143
	.db #0xdf	; 223
	.db #0x8f	; 143
	.db #0x27	; 39
	.db #0x8f	; 143
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfb	; 251
	.db #0xff	; 255
	.db #0xf7	; 247
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0xdf	; 223
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfb	; 251
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0xff	; 255
	.db #0xdf	; 223
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0xf7	; 247
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfd	; 253
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfd	; 253
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xaf	; 175
	.db #0x77	; 119	'w'
	.db #0xff	; 255
	.db #0xfb	; 251
	.db #0xfd	; 253
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfd	; 253
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfb	; 251
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf7	; 247
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfb	; 251
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0x7d	; 125
	.db #0xfe	; 254
	.db #0x7c	; 124
	.db #0x39	; 57	'9'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf7	; 247
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xdf	; 223
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfd	; 253
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xfd	; 253
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xdf	; 223
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf7	; 247
	.db #0xff	; 255
	.db #0xfb	; 251
	.db #0xfe	; 254
	.db #0xfd	; 253
	.db #0xfd	; 253
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xab	; 171
	.db #0x11	; 17
	.db #0xc7	; 199
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0x83	; 131
	.db #0xab	; 171
	.db #0x11	; 17
	.db #0x7c	; 124
	.db #0x39	; 57	'9'
	.db #0x7d	; 125
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfb	; 251
	.db #0xdf	; 223
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xfb	; 251
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfd	; 253
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfd	; 253
	.db #0xfb	; 251
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xdf	; 223
	.db #0x3f	; 63
	.db #0xbf	; 191
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0xbf	; 191
	.db #0xff	; 255
	.db #0xdf	; 223
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0xfb	; 251
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfd	; 253
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfd	; 253
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfb	; 251
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf7	; 247
	.db #0xff	; 255
	.db #0xfb	; 251
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfd	; 253
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
_bkg_tiles:
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x04	; 4
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0xfc	; 252
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x02	; 2
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0xfc	; 252
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0xfc	; 252
	.db #0x11	; 17
	.db #0x12	; 18
	.db #0x13	; 19
	.db #0x14	; 20
	.db #0x15	; 21
	.db #0x16	; 22
	.db #0x17	; 23
	.db #0xfc	; 252
	.db #0x18	; 24
	.db #0x19	; 25
	.db #0x1a	; 26
	.db #0xfc	; 252
	.db #0x1b	; 27
	.db #0x1c	; 28
	.db #0x1d	; 29
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x1e	; 30
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0x21	; 33
	.db #0x22	; 34
	.db #0xfc	; 252
	.db #0x23	; 35
	.db #0x24	; 36
	.db #0x25	; 37
	.db #0xfc	; 252
	.db #0x26	; 38
	.db #0x27	; 39
	.db #0x13	; 19
	.db #0x28	; 40
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x2b	; 43
	.db #0x2c	; 44
	.db #0x11	; 17
_earth_tiles:
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x08	; 8
	.db #0x0a	; 10
	.db #0x0c	; 12
	.db #0x0e	; 14
	.db #0x10	; 16
	.db #0x12	; 18
	.db #0x14	; 20
	.db #0x16	; 22
	.db #0x18	; 24
	.db #0x1a	; 26
_frame_tiles:
	.db #0x80	; 128
	.db #0x81	; 129
	.db #0xfd	; 253
	.db #0x82	; 130
	.db #0x83	; 131
	.db #0x81	; 129
	.db #0xfd	; 253
	.db #0x82	; 130
	.db #0x83	; 131
	.db #0x81	; 129
	.db #0xfd	; 253
	.db #0x82	; 130
	.db #0x83	; 131
	.db #0x81	; 129
	.db #0xfd	; 253
	.db #0x84	; 132
	.db #0x85	; 133
	.db #0x86	; 134
	.db #0x87	; 135
	.db #0x88	; 136
	.db #0x89	; 137
	.db #0x8a	; 138
	.db #0x87	; 135
	.db #0x88	; 136
	.db #0x89	; 137
	.db #0x8a	; 138
	.db #0x87	; 135
	.db #0x88	; 136
	.db #0x89	; 137
	.db #0x8a	; 138
	.db #0x8b	; 139
	.db #0x8c	; 140
	.db #0xfd	; 253
	.db #0x8d	; 141
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x8e	; 142
	.db #0x8f	; 143
	.db #0x82	; 130
	.db #0x8c	; 140
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x85	; 133
	.db #0x90	; 144
	.db #0x8e	; 142
	.db #0x8f	; 143
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfd	; 253
	.db #0x8d	; 141
	.db #0x85	; 133
	.db #0x90	; 144
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x82	; 130
	.db #0x8c	; 140
	.db #0xfd	; 253
	.db #0x8d	; 141
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x8e	; 142
	.db #0x8f	; 143
	.db #0x82	; 130
	.db #0x8c	; 140
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x85	; 133
	.db #0x90	; 144
	.db #0x8e	; 142
	.db #0x91	; 145
	.db #0xfd	; 253
	.db #0x82	; 130
	.db #0x83	; 131
	.db #0x81	; 129
	.db #0xfd	; 253
	.db #0x82	; 130
	.db #0x83	; 131
	.db #0x81	; 129
	.db #0xfd	; 253
	.db #0x82	; 130
	.db #0x83	; 131
	.db #0x81	; 129
	.db #0x92	; 146
	.db #0x8d	; 141
	.db #0x93	; 147
	.db #0x8a	; 138
	.db #0x87	; 135
	.db #0x88	; 136
	.db #0x89	; 137
	.db #0x8a	; 138
	.db #0x87	; 135
	.db #0x88	; 136
	.db #0x89	; 137
	.db #0x8a	; 138
	.db #0x87	; 135
	.db #0x88	; 136
	.db #0x89	; 137
	.db #0x8a	; 138
	.db #0x87	; 135
	.db #0x94	; 148
_door1_tiles:
	.db #0x95	; 149
	.db #0x95	; 149
	.db #0x95	; 149
	.db #0x95	; 149
	.db #0x95	; 149
	.db #0x95	; 149
	.db #0x95	; 149
	.db #0x95	; 149
	.db #0x95	; 149
	.db #0x95	; 149
	.db #0x95	; 149
	.db #0x95	; 149
	.db #0x96	; 150
	.db #0x96	; 150
	.db #0x96	; 150
	.db #0x96	; 150
	.db #0x96	; 150
	.db #0x96	; 150
	.db #0x96	; 150
	.db #0x96	; 150
	.db #0x96	; 150
	.db #0x96	; 150
	.db #0x96	; 150
	.db #0x96	; 150
	.db #0x97	; 151
	.db #0x97	; 151
	.db #0x97	; 151
	.db #0x97	; 151
	.db #0x97	; 151
	.db #0x97	; 151
	.db #0x97	; 151
	.db #0x97	; 151
	.db #0x97	; 151
	.db #0x97	; 151
	.db #0x97	; 151
	.db #0x97	; 151
	.db #0x95	; 149
	.db #0x95	; 149
	.db #0x95	; 149
	.db #0x95	; 149
	.db #0x95	; 149
	.db #0x95	; 149
	.db #0x95	; 149
	.db #0x95	; 149
	.db #0x95	; 149
	.db #0x95	; 149
	.db #0x95	; 149
	.db #0x95	; 149
	.db #0x96	; 150
	.db #0x96	; 150
	.db #0x96	; 150
	.db #0x96	; 150
	.db #0x96	; 150
	.db #0x96	; 150
	.db #0x96	; 150
	.db #0x96	; 150
	.db #0x96	; 150
	.db #0x96	; 150
	.db #0x96	; 150
	.db #0x96	; 150
	.db #0x97	; 151
	.db #0x97	; 151
	.db #0x97	; 151
	.db #0x97	; 151
	.db #0x97	; 151
	.db #0x97	; 151
	.db #0x97	; 151
	.db #0x97	; 151
	.db #0x97	; 151
	.db #0x97	; 151
	.db #0x97	; 151
	.db #0x97	; 151
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
_door2_tiles:
	.db #0x98	; 152
	.db #0x98	; 152
	.db #0x98	; 152
	.db #0x98	; 152
	.db #0x98	; 152
	.db #0x98	; 152
	.db #0x98	; 152
	.db #0x98	; 152
	.db #0x98	; 152
	.db #0x98	; 152
	.db #0x98	; 152
	.db #0x98	; 152
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x9a	; 154
	.db #0x9a	; 154
	.db #0x9a	; 154
	.db #0x9a	; 154
	.db #0x9a	; 154
	.db #0x9a	; 154
	.db #0x9a	; 154
	.db #0x9a	; 154
	.db #0x9a	; 154
	.db #0x9a	; 154
	.db #0x9a	; 154
	.db #0x9a	; 154
	.db #0x98	; 152
	.db #0x98	; 152
	.db #0x98	; 152
	.db #0x98	; 152
	.db #0x98	; 152
	.db #0x98	; 152
	.db #0x98	; 152
	.db #0x98	; 152
	.db #0x98	; 152
	.db #0x98	; 152
	.db #0x98	; 152
	.db #0x98	; 152
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x9b	; 155
	.db #0x9b	; 155
	.db #0x9b	; 155
	.db #0x9b	; 155
	.db #0x9b	; 155
	.db #0x9b	; 155
	.db #0x9b	; 155
	.db #0x9b	; 155
	.db #0x9b	; 155
	.db #0x9b	; 155
	.db #0x9b	; 155
	.db #0x9b	; 155
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
_door3_tiles:
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0x9d	; 157
	.db #0x9d	; 157
	.db #0x9d	; 157
	.db #0x9d	; 157
	.db #0x9d	; 157
	.db #0x9d	; 157
	.db #0x9d	; 157
	.db #0x9d	; 157
	.db #0x9d	; 157
	.db #0x9d	; 157
	.db #0x9d	; 157
	.db #0x9d	; 157
	.db #0x9e	; 158
	.db #0x9e	; 158
	.db #0x9e	; 158
	.db #0x9e	; 158
	.db #0x9e	; 158
	.db #0x9e	; 158
	.db #0x9e	; 158
	.db #0x9e	; 158
	.db #0x9e	; 158
	.db #0x9e	; 158
	.db #0x9e	; 158
	.db #0x9e	; 158
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0x9d	; 157
	.db #0x9d	; 157
	.db #0x9d	; 157
	.db #0x9d	; 157
	.db #0x9d	; 157
	.db #0x9d	; 157
	.db #0x9d	; 157
	.db #0x9d	; 157
	.db #0x9d	; 157
	.db #0x9d	; 157
	.db #0x9d	; 157
	.db #0x9d	; 157
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
_door4_tiles:
	.db #0x95	; 149
	.db #0x95	; 149
	.db #0x95	; 149
	.db #0x95	; 149
	.db #0x95	; 149
	.db #0x95	; 149
	.db #0x95	; 149
	.db #0x95	; 149
	.db #0x95	; 149
	.db #0x95	; 149
	.db #0x95	; 149
	.db #0x95	; 149
	.db #0x96	; 150
	.db #0x96	; 150
	.db #0x96	; 150
	.db #0x96	; 150
	.db #0x96	; 150
	.db #0x96	; 150
	.db #0x96	; 150
	.db #0x96	; 150
	.db #0x96	; 150
	.db #0x96	; 150
	.db #0x96	; 150
	.db #0x96	; 150
	.db #0x97	; 151
	.db #0x97	; 151
	.db #0x97	; 151
	.db #0x97	; 151
	.db #0x97	; 151
	.db #0x97	; 151
	.db #0x97	; 151
	.db #0x97	; 151
	.db #0x97	; 151
	.db #0x97	; 151
	.db #0x97	; 151
	.db #0x97	; 151
	.db #0x95	; 149
	.db #0x95	; 149
	.db #0x95	; 149
	.db #0x95	; 149
	.db #0x95	; 149
	.db #0x95	; 149
	.db #0x95	; 149
	.db #0x95	; 149
	.db #0x95	; 149
	.db #0x95	; 149
	.db #0x95	; 149
	.db #0x95	; 149
	.db #0x96	; 150
	.db #0x96	; 150
	.db #0x96	; 150
	.db #0x96	; 150
	.db #0x96	; 150
	.db #0x96	; 150
	.db #0x96	; 150
	.db #0x96	; 150
	.db #0x96	; 150
	.db #0x96	; 150
	.db #0x96	; 150
	.db #0x96	; 150
	.db #0xa0	; 160
	.db #0xa0	; 160
	.db #0xa0	; 160
	.db #0xa0	; 160
	.db #0xa0	; 160
	.db #0xa0	; 160
	.db #0xa0	; 160
	.db #0xa0	; 160
	.db #0xa0	; 160
	.db #0xa0	; 160
	.db #0xa0	; 160
	.db #0xa0	; 160
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
_film:
	.dw (_door1_tiles + 0)
	.dw (_door2_tiles + 0)
	.dw (_door3_tiles + 0)
	.dw (_door4_tiles + 0)
	.dw (_door1_tiles + 12)
	.dw (_door2_tiles + 12)
	.dw (_door3_tiles + 12)
	.dw (_door4_tiles + 12)
	.dw (_door1_tiles + 24)
	.dw (_door2_tiles + 24)
	.dw (_door3_tiles + 24)
	.dw (_door4_tiles + 24)
	.dw (_door1_tiles + 36)
	.dw (_door2_tiles + 36)
	.dw (_door3_tiles + 36)
	.dw (_door4_tiles + 36)
	.dw (_door1_tiles + 48)
	.dw (_door2_tiles + 48)
	.dw (_door3_tiles + 48)
	.dw (_door4_tiles + 48)
	.dw (_door1_tiles + 60)
	.dw (_door2_tiles + 60)
	.dw (_door3_tiles + 60)
	.dw (_door4_tiles + 60)
	.dw (_door1_tiles + 72)
;galaxy.c:414: void scroll()
;	---------------------------------
; Function scroll
; ---------------------------------
_scroll::
	add	sp, #-4
;galaxy.c:417: bposx.w += bspx.w;
	ld	hl, #_bposx
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_bspx
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #_bposx
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;galaxy.c:418: bposy.w += bspy.w;
	ld	hl, #_bposy
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_bspy
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #_bposy
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;galaxy.c:419: SCX_REG = bposx.b.h;
	ld	a, (#(_bposx + 0x0001) + 0)
	ldh	(_SCX_REG+0),a
;galaxy.c:420: SCY_REG = bposy.b.h;
	ld	a, (#(_bposy + 0x0001) + 0)
	ldh	(_SCY_REG+0),a
;galaxy.c:423: wposx.w += wspx.w ;
	ld	hl, #_wposx
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_wspx
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #_wposx
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;galaxy.c:424: wposy.w += wspy.w ;
	ld	hl, #_wposy
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_wspy
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #_wposy
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;galaxy.c:426: if(wposx.b.h >= MAXWINX) {
	ld	a, (#(_wposx + 0x0001) + 0)
	ldhl	sp,	#3
	ld	(hl), a
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, #0xa6
	jr	C, 00104$
;galaxy.c:427: wposx.b.h = MAXWINX;
	ld	hl, #(_wposx + 0x0001)
	ld	(hl), #0xa6
;galaxy.c:429: wspx.w = -(WORD)wspx.w;
	ld	de, #_wspx
	ld	a, (de)
	ldhl	sp,	#2
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#0
	ld	(hl+), a
	ld	(hl), e
	ld	de, #0x0000
	pop	hl
	push	hl
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	(hl), e
	ld	de, #_wspx
	ld	a, (hl)
	ld	(de), a
	inc	de
	inc	hl
	ld	a, (hl)
	ld	(de), a
	jr	00105$
00104$:
;galaxy.c:430: } else if(wposx.b.h <= MINWINX) {
	ld	a, #0x27
	ldhl	sp,	#3
	sub	a, (hl)
	jr	C, 00105$
;galaxy.c:431: wposx.b.h = MINWINX;
	ld	hl, #(_wposx + 0x0001)
	ld	(hl), #0x27
;galaxy.c:433: wspx.w = -(WORD)wspx.w;
	ld	hl, #_wspx
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	xor	a, a
	sub	a, c
	ld	c, a
	ld	a, #0x00
	sbc	a, b
	ld	b, a
	ld	hl, #_wspx
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
00105$:
;galaxy.c:435: WX_REG = wposx.b.h;
	ld	a, (#(_wposx + 0x0001) + 0)
	ldh	(_WX_REG+0),a
;galaxy.c:437: if(wposy.b.h >= MAXWINY) {
	ld	hl, #(_wposy + 0x0001)
	ld	b, (hl)
	ld	a, b
	sub	a, #0x8f
	jr	C, 00109$
;galaxy.c:438: wposy.b.h = MAXWINY;
	ld	hl, #(_wposy + 0x0001)
	ld	(hl), #0x8f
;galaxy.c:440: wspy.w = -(WORD)wspy.w;
	ld	hl, #_wspy
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	xor	a, a
	sub	a, c
	ld	c, a
	ld	a, #0x00
	sbc	a, b
	ld	b, a
	ld	hl, #_wspy
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	jr	00110$
00109$:
;galaxy.c:441: } else if(wposy.b.h <= MINWINY) {
	ld	a, #0x40
	sub	a, b
	jr	C, 00110$
;galaxy.c:442: wposy.b.h = MINWINY;
	ld	hl, #(_wposy + 0x0001)
	ld	(hl), #0x40
;galaxy.c:444: wspy.w = -(WORD)wspy.w;
	ld	hl, #_wspy
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	xor	a, a
	sub	a, c
	ld	c, a
	ld	a, #0x00
	sbc	a, b
	ld	b, a
	ld	hl, #_wspy
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
00110$:
;galaxy.c:446: WY_REG = wposy.b.h;
	ld	a, (#(_wposy + 0x0001) + 0)
	ldh	(_WY_REG+0),a
;galaxy.c:449: sposx.w += sspx.w;
	ld	hl, #_sposx
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_sspx
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #_sposx
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;galaxy.c:450: sposy.w += sspy.w;
	ld	hl, #_sposy
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_sspy
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #_sposy
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;galaxy.c:451: place_sprite();
	call	_place_sprite
;galaxy.c:452: }
	add	sp, #4
	ret
;galaxy.c:455: void door()
;	---------------------------------
; Function door
; ---------------------------------
_door::
;galaxy.c:457: if(doorstate == OPENING) {
	ld	a, (#_doorstate)
	dec	a
	jr	NZ, 00108$
;galaxy.c:458: doorpos++;
	ld	hl, #_doorpos
	inc	(hl)
;galaxy.c:460: set_win_tiles(2, 2, 12, 6, film[doorpos]);
	ld	bc, #_film+0
	ld	e, (hl)
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	de, #0x060c
	push	de
	ld	de, #0x0202
	push	de
	call	_set_win_tiles
	add	sp, #6
;galaxy.c:461: if(doorpos == NBDFRAMES)
	ld	a, (#_doorpos)
	sub	a, #0x18
	ret	NZ
;galaxy.c:462: doorstate = OPENED;
	ld	hl, #_doorstate
	ld	(hl), #0x02
	ret
00108$:
;galaxy.c:463: } else if(doorstate == CLOSING) {
	ld	a, (#_doorstate)
	sub	a, #0x03
	ret	NZ
;galaxy.c:464: doorpos--;
	ld	hl, #_doorpos
	dec	(hl)
;galaxy.c:466: set_win_tiles(2, 2, 12, 6, film[doorpos]);
	ld	bc, #_film+0
	ld	e, (hl)
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	de, #0x060c
	push	de
	ld	de, #0x0202
	push	de
	call	_set_win_tiles
	add	sp, #6
;galaxy.c:467: if(doorpos == 0)
	ld	a, (#_doorpos)
	or	a, a
	ret	NZ
;galaxy.c:468: doorstate = CLOSED;
	ld	hl, #_doorstate
	ld	(hl), #0x00
;galaxy.c:470: }
	ret
;galaxy.c:473: void animate_sprite()
;	---------------------------------
; Function animate_sprite
; ---------------------------------
_animate_sprite::
;galaxy.c:475: if((time&0x07) == 0) {
	ld	a, (#_time)
	and	a, #0x07
	ret	NZ
;galaxy.c:476: sframe++;
	ld	hl, #_sframe
	inc	(hl)
;galaxy.c:477: if(sframe == NBSFRAMES)
	ld	a, (hl)
	sub	a, #0x07
	jp	NZ,_tile_sprite
;galaxy.c:478: sframe = 0;
	ld	hl, #_sframe
	ld	(hl), #0x00
;galaxy.c:479: tile_sprite();
;galaxy.c:481: }
	jp  _tile_sprite
;galaxy.c:484: void tile_sprite()
;	---------------------------------
; Function tile_sprite
; ---------------------------------
_tile_sprite::
;galaxy.c:488: s = sframe<<1;
	ld	a, (#_sframe)
	add	a, a
	ld	c, a
;galaxy.c:489: set_sprite_tile(0, earth_tiles[s]);
	ld	hl, #_earth_tiles
	ld	b, #0x00
	add	hl, bc
	ld	b, (hl)
;/opt/gbdk/include/gb/gb.h:999: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x0002)
	ld	(hl), b
;galaxy.c:490: set_sprite_tile(1, earth_tiles[s+1]);
	inc	c
	ld	a, c
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_earth_tiles
	add	hl, bc
	ld	c, (hl)
;/opt/gbdk/include/gb/gb.h:999: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x0006)
	ld	(hl), c
;galaxy.c:490: set_sprite_tile(1, earth_tiles[s+1]);
;galaxy.c:491: }
	ret
;galaxy.c:494: void place_sprite()
;	---------------------------------
; Function place_sprite
; ---------------------------------
_place_sprite::
;galaxy.c:496: move_sprite(0, sposx.b.h, sposy.b.h);
	ld	hl, #(_sposy + 0x0001)
	ld	b, (hl)
	ld	hl, #(_sposx + 0x0001)
	ld	c, (hl)
;/opt/gbdk/include/gb/gb.h:1072: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;/opt/gbdk/include/gb/gb.h:1073: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;galaxy.c:497: move_sprite(1, sposx.b.h+8, sposy.b.h);
	ld	hl, #(_sposy + 0x0001)
	ld	b, (hl)
	ld	a, (#(_sposx + 0x0001) + 0)
	add	a, #0x08
	ld	c, a
;/opt/gbdk/include/gb/gb.h:1072: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x0004)
;/opt/gbdk/include/gb/gb.h:1073: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;galaxy.c:497: move_sprite(1, sposx.b.h+8, sposy.b.h);
;galaxy.c:498: }
	ret
;galaxy.c:500: void main()
;	---------------------------------
; Function main
; ---------------------------------
_main::
	add	sp, #-8
;galaxy.c:504: disable_interrupts();
	call	_disable_interrupts
;galaxy.c:505: DISPLAY_OFF;
	call	_display_off
;galaxy.c:506: LCDC_REG = 0x67;
	ld	a, #0x67
	ldh	(_LCDC_REG+0),a
;galaxy.c:518: doorstate = CLOSED;
	ld	hl, #_doorstate
	ld	(hl), #0x00
;galaxy.c:521: BGP_REG = OBP0_REG = OBP1_REG = 0xE4U;
	ld	a, #0xe4
	ldh	(_OBP1_REG+0),a
	ld	a, #0xe4
	ldh	(_OBP0_REG+0),a
	ld	a, #0xe4
	ldh	(_BGP_REG+0),a
;galaxy.c:524: set_bkg_data(0xFC, 0x04, std_data);
	ld	hl, #_std_data
	push	hl
	ld	de, #0x04fc
	push	de
	call	_set_bkg_data
	add	sp, #4
;galaxy.c:525: set_bkg_data(0x00, 0x2D, bkg_data);
	ld	hl, #_bkg_data
	push	hl
	ld	a, #0x2d
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_bkg_data
	add	sp, #4
;galaxy.c:532: for(i = 0; i < 32; i+=8)
	ld	c, #0x00
00150$:
;galaxy.c:533: for(j = 0; j < 32; j+=8)
	ld	b, #0x00
00148$:
;galaxy.c:534: set_bkg_tiles(i, j, 8, 8, bkg_tiles);
	ld	hl, #_bkg_tiles
	push	hl
	ld	de, #0x0808
	push	de
	push	bc
	inc	sp
	ld	a, c
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;galaxy.c:533: for(j = 0; j < 32; j+=8)
	ld	a, b
	add	a, #0x08
	ld	b, a
	sub	a, #0x20
	jr	C, 00148$
;galaxy.c:532: for(i = 0; i < 32; i+=8)
	ld	a, c
	add	a, #0x08
	ld	c, a
	sub	a, #0x20
	jr	C, 00150$
;galaxy.c:535: bposx.w = 0;
	ld	hl, #_bposx
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;galaxy.c:536: SCX_REG = 0;
	ld	a, #0x00
	ldh	(_SCX_REG+0),a
;galaxy.c:537: bposy.w = 0;
	ld	hl, #_bposy
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;galaxy.c:538: SCY_REG = 0;
	ld	a, #0x00
	ldh	(_SCY_REG+0),a
;galaxy.c:539: bspx.w = 0xFF00;
	ld	hl, #_bspx
	ld	a, #0x00
	ld	(hl+), a
	ld	(hl), #0xff
;galaxy.c:540: bspy.w = 0x0080;
	ld	hl, #_bspy
	ld	a, #0x80
	ld	(hl+), a
	ld	(hl), #0x00
;galaxy.c:543: set_win_data(0x80, 0x21, frame_data);
	ld	hl, #_frame_data
	push	hl
	ld	de, #0x2180
	push	de
	call	_set_win_data
	add	sp, #4
;galaxy.c:550: set_win_tiles(0, 0, 16, 10, frame_tiles);
	ld	hl, #_frame_tiles
	push	hl
	ld	de, #0x0a10
	push	de
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;galaxy.c:557: set_win_tiles(2, 2, 12, 6, door1_tiles);
	ld	hl, #_door1_tiles
	push	hl
	ld	de, #0x060c
	push	de
	ld	a, #0x02
	ld	d,a
	ld	e,#0x02
	push	de
	call	_set_win_tiles
	add	sp, #6
;galaxy.c:558: wposx.b.h = MAXWNDPOSX;
	ld	hl, #(_wposx + 0x0001)
	ld	(hl), #0xa6
;galaxy.c:559: wposx.b.l = 0;
	ld	hl, #_wposx
	ld	(hl), #0x00
;galaxy.c:560: WX_REG = MAXWNDPOSX;
	ld	a, #0xa6
	ldh	(_WX_REG+0),a
;galaxy.c:561: wposy.b.h = MAXWNDPOSY;
	ld	hl, #(_wposy + 0x0001)
	ld	(hl), #0x8f
;galaxy.c:562: wposy.b.l = 0;
	ld	hl, #_wposy
	ld	(hl), #0x00
;galaxy.c:563: WY_REG = MAXWNDPOSY;
	ld	a, #0x8f
	ldh	(_WY_REG+0),a
;galaxy.c:564: wspx.w = 0xFF80;
	ld	hl, #_wspx
	ld	a, #0x80
	ld	(hl+), a
	ld	(hl), #0xff
;galaxy.c:565: wspy.w = 0xFFC0;
	ld	hl, #_wspy
	ld	a, #0xc0
	ld	(hl+), a
	ld	(hl), #0xff
;galaxy.c:568: set_sprite_data(0x00, 0x1C, earth_data);
	ld	hl, #_earth_data
	push	hl
	ld	a, #0x1c
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_sprite_data
	add	sp, #4
;/opt/gbdk/include/gb/gb.h:1045: shadow_OAM[nb].prop=prop;
	ld	hl, #(_shadow_OAM + 0x0003)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 0x0007)
	ld	(hl), #0x00
;galaxy.c:571: sframe = 0;
	ld	hl, #_sframe
	ld	(hl), #0x00
;galaxy.c:572: sposx.w  = 0x1000;
	ld	hl, #_sposx
	ld	a, #0x00
	ld	(hl+), a
	ld	(hl), #0x10
;galaxy.c:573: sposy.w  = 0x1000;
	ld	hl, #_sposy
	ld	a, #0x00
	ld	(hl+), a
	ld	(hl), #0x10
;galaxy.c:574: sspx.w  = 0x0040;
	ld	hl, #_sspx
	ld	a, #0x40
	ld	(hl+), a
	ld	(hl), #0x00
;galaxy.c:575: sspy.w  = 0x0040;
	ld	hl, #_sspy
	ld	a, #0x40
	ld	(hl+), a
	ld	(hl), #0x00
;galaxy.c:576: tile_sprite();
	call	_tile_sprite
;galaxy.c:577: place_sprite();
	call	_place_sprite
;galaxy.c:579: DISPLAY_ON;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x01
	ldh	(_LCDC_REG+0),a
;galaxy.c:580: enable_interrupts();
	call	_enable_interrupts
;galaxy.c:584: for(i = 0; i < 4; i++)
00161$:
	ld	c, #0x04
00154$:
;galaxy.c:585: wait_vbl_done();
	call	_wait_vbl_done
;galaxy.c:584: for(i = 0; i < 4; i++)
	dec	c
	jr	NZ, 00154$
;galaxy.c:586: time++;
	ld	hl, #_time
	inc	(hl)
;galaxy.c:587: fade();
	call	_fade
;galaxy.c:588: door();
	call	_door
;galaxy.c:589: scroll();
	call	_scroll
;galaxy.c:590: animate_sprite();
	call	_animate_sprite
;galaxy.c:591: i = joypad();
	call	_joypad
;galaxy.c:593: if(i & J_UP)
	ld	a, e
	and	a, #0x04
	ldhl	sp,	#6
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
;galaxy.c:595: if(i & J_DOWN)
	ld	a, e
	and	a, #0x08
	ld	c, a
	ld	b, #0x00
;galaxy.c:597: if(i & J_LEFT)
	ld	a, e
	and	a, #0x02
	ldhl	sp,	#0
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
;galaxy.c:599: if(i & J_RIGHT)
	ld	a, e
	and	a, #0x01
	inc	hl
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
;galaxy.c:592: if(i & J_B) {
	bit	5, e
	jp	Z,00141$
;galaxy.c:593: if(i & J_UP)
	ldhl	sp,	#7
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00105$
;galaxy.c:594: bspy.w -= 0x0010;
	ld	de, #_bspy
	ld	a, (de)
	dec	hl
	dec	hl
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0010
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#7
	ld	(hl-), a
	ld	(hl), e
	ld	de, #_bspy
	ld	a, (hl)
	ld	(de), a
	inc	de
	inc	hl
	ld	a, (hl)
	ld	(de), a
00105$:
;galaxy.c:595: if(i & J_DOWN)
	ld	a, b
	or	a, c
	jr	Z, 00107$
;galaxy.c:596: bspy.w += 0x0010;
	ld	de, #_bspy
	ld	a, (de)
	ldhl	sp,	#4
	ld	(hl+), a
	inc	de
	ld	a, (de)
;c
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0010
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl), a
	ld	de, #_bspy
	dec	hl
	ld	a, (hl)
	ld	(de), a
	inc	de
	inc	hl
	ld	a, (hl)
	ld	(de), a
00107$:
;galaxy.c:597: if(i & J_LEFT)
	ldhl	sp,	#1
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00109$
;galaxy.c:598: bspx.w -= 0x0010;
	ld	hl, #_bspx
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	add	a, #0xf0
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	b, a
	ld	hl, #_bspx
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
00109$:
;galaxy.c:599: if(i & J_RIGHT)
	ldhl	sp,	#3
	ld	a, (hl-)
	or	a, (hl)
	jp	Z, 00161$
;galaxy.c:600: bspx.w += 0x0010;
	ld	hl, #_bspx
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0010
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #_bspx
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	jp	00161$
00141$:
;galaxy.c:601: } else if(i & J_A) {
	bit	4, e
	jr	Z, 00138$
;galaxy.c:602: if(i & J_UP)
	ldhl	sp,	#7
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00113$
;galaxy.c:603: wspy.w -= 0x0010;
	ld	de, #_wspy
	ld	a, (de)
	dec	hl
	dec	hl
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0010
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#7
	ld	(hl-), a
	ld	(hl), e
	ld	de, #_wspy
	ld	a, (hl)
	ld	(de), a
	inc	de
	inc	hl
	ld	a, (hl)
	ld	(de), a
00113$:
;galaxy.c:604: if(i & J_DOWN)
	ld	a, b
	or	a, c
	jr	Z, 00115$
;galaxy.c:605: wspy.w += 0x0010;
	ld	hl, #_wspy
	ld	a, (hl+)
	ld	b, a
	ld	c, (hl)
	ld	a, b
	add	a, #0x10
	ld	b, a
	jr	NC, 00285$
	inc	c
00285$:
	ld	hl, #_wspy
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
00115$:
;galaxy.c:606: if(i & J_LEFT)
	ldhl	sp,	#1
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00117$
;galaxy.c:607: wspx.w -= 0x0010;
	ld	hl, #_wspx
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	add	a, #0xf0
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	b, a
	ld	hl, #_wspx
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
00117$:
;galaxy.c:608: if(i & J_RIGHT)
	ldhl	sp,	#3
	ld	a, (hl-)
	or	a, (hl)
	jp	Z, 00161$
;galaxy.c:609: wspx.w += 0x0010;
	ld	hl, #_wspx
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0010
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #_wspx
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	jp	00161$
00138$:
;galaxy.c:611: if(i & J_SELECT)
	bit	6, e
	jr	Z, 00121$
;galaxy.c:612: color = STARTFADE;
	ld	hl, #_color
	ld	(hl), #0x60
00121$:
;galaxy.c:613: if(i & J_START)
	bit	7, e
	jr	Z, 00128$
;galaxy.c:614: if(doorstate == CLOSED) {
	ld	hl, #_doorstate
	ld	a, (hl)
	or	a, a
	jr	NZ, 00125$
;galaxy.c:615: doorstate = OPENING;
	ld	(hl), #0x01
;galaxy.c:616: doorpos = 0;
	ld	hl, #_doorpos
	ld	(hl), #0x00
	jr	00128$
00125$:
;galaxy.c:617: } else if(doorstate == OPENED) {
	ld	a, (#_doorstate)
	sub	a, #0x02
	jr	NZ, 00128$
;galaxy.c:618: doorstate = CLOSING;
	ld	hl, #_doorstate
	ld	(hl), #0x03
;galaxy.c:619: doorpos = NBDFRAMES;
	ld	hl, #_doorpos
	ld	(hl), #0x18
00128$:
;galaxy.c:621: if(i & J_UP)
	ldhl	sp,	#7
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00130$
;galaxy.c:622: sspy.w -= 0x0010;
	ld	de, #_sspy
	ld	a, (de)
	dec	hl
	dec	hl
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0010
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#7
	ld	(hl-), a
	ld	(hl), e
	ld	de, #_sspy
	ld	a, (hl)
	ld	(de), a
	inc	de
	inc	hl
	ld	a, (hl)
	ld	(de), a
00130$:
;galaxy.c:623: if(i & J_DOWN)
	ld	a, b
	or	a, c
	jr	Z, 00132$
;galaxy.c:624: sspy.w += 0x0010;
	ld	de, #_sspy
	ld	a, (de)
	ldhl	sp,	#4
	ld	(hl+), a
	inc	de
	ld	a, (de)
;c
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0010
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl), a
	ld	de, #_sspy
	dec	hl
	ld	a, (hl)
	ld	(de), a
	inc	de
	inc	hl
	ld	a, (hl)
	ld	(de), a
00132$:
;galaxy.c:625: if(i & J_LEFT)
	ldhl	sp,	#1
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00134$
;galaxy.c:626: sspx.w -= 0x0010;
	ld	hl, #_sspx
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	add	a, #0xf0
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	b, a
	ld	hl, #_sspx
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
00134$:
;galaxy.c:627: if(i & J_RIGHT)
	ldhl	sp,	#3
	ld	a, (hl-)
	or	a, (hl)
	jp	Z, 00161$
;galaxy.c:628: sspx.w += 0x0010;
	ld	hl, #_sspx
	ld	a, (hl+)
	ld	b, a
	ld	c, (hl)
	ld	a, b
	add	a, #0x10
	ld	b, a
	jr	NC, 00290$
	inc	c
00290$:
	ld	hl, #_sspx
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
	jp	00161$
;galaxy.c:631: }
	add	sp, #8
	ret
	.area _CODE
	.area _CABS (ABS)
