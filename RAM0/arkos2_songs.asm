PUBLIC _akg_song
_akg_song:
defb 0

PUBLIC _TABLA_SONG_CMP
_TABLA_SONG_CMP:
	defw	_song0, _song1

PUBLIC _BUFFER_UNCOMP
_BUFFER_UNCOMP:
	defs 6218
_endBuffer:


;songs should be targeted at address $CBF8
; *** Songs ***
_song0:
    binary "music1.zx0"
endofsong0:

_song1:
    binary "music2.zx0"
endofsong1:

