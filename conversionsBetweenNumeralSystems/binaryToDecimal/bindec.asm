;=====================================================================
; binary -> decimal
; od poczatku stringa do konca
;=====================================================================

section	.text
global  bindec

bindec:
	push	ebp
	mov		ebp, esp
	mov		ebx, [ebp+8] ; pierwotna wartosc - zrodlo (source) stad czytamy
  mov   [ebp-4],  WORD 0 ; tutaj bedzie wynik
  mov   [ebp-8],  WORD 1 ; tutaj jest dodawana wartosc
  mov   [ebp-12], BYTE 2 ; tutaj jest mnoznik 2

begin:
  mov   cl, [ebx]
  cmp		cl, 0
  jz    end
  cmp   cl, '1'
  je    setbit
  jmp   continue

setbit:
  mov   ax, [ebp-8]
  add   [ebp-4], ax

continue:
  inc   ebx
  mov   ax, WORD [ebp-8]
  mul   BYTE [ebp-12]
  mov   [ebp-8], WORD ax
  jmp   begin

end:
  mov   eax, DWORD 0
	mov		ax, WORD [ebp-4]
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
