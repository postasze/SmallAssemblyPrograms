;=====================================================================
; decimal -> binary
;=====================================================================

section	.text
global  decbin

decbin:
	push	ebp
	mov		ebp, esp
	mov		ecx, [ebp+8] ; przeksztalcona wartosc (destination) tu piszemy
  mov		ebx, [ebp+12] ; pierwotna wartosc - zrodlo (source) stad odczytujemy liczbe integer
  mov   [ebp-4], BYTE 2

begin:
  mov   eax, DWORD 0
  mov   edx, DWORD 0
  mov   eax, ebx
  div   BYTE [ebp-4]
  add   ah, 48
  mov   [ecx], BYTE ah ; reszta z dzielenia
  inc   ecx
  mov   bl, al
  cmp   bl, 0
  je    end
  jmp   begin

end:
  mov   [ecx], BYTE 0
  mov   eax, [ebp+8]
	mov	  esp, ebp
	pop		ebp
	ret

;============================================
; STACK
;============================================
;
; greater addresses
;
;  |                                |
;  | ...                            |
;  ----------------------------------
;  | function argument - char *str  | EBP+8
;  ----------------------------------
;  | return address                 | EBP+4
;  ----------------------------------
;  | saved ebp value                | EBP, ESP
;  ----------------------------------
;  | ... local variables            | EBP-x
;  |                                |
;
; \/                               \/
; \/ stack is growing in this      \/
; \/                direction      \/
;
; lower addresses
;
;
;============================================
