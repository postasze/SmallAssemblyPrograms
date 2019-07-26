;=====================================================================
; decimal -> hexadecimal uwaga wynik jest pisany w odwrotnej kolejnosci
;=====================================================================

section	.text
global  dechex

dechex:
	push	ebp
	mov		ebp, esp
	mov		ecx, [ebp+8] ; przeksztalcona wartosc (destination) tu piszemy
  mov		ebx, [ebp+12] ; pierwotna wartosc - zrodlo (source) stad odczytujemy liczbe integer
  mov   [ebp-4], DWORD 16 ; wartosc przez ktora dzielimy

begin:
  mov   eax, DWORD 0
  mov   edx, DWORD 0
  mov   eax, ebx
  div   DWORD [ebp-4]
  cmp   edx, 10
  jl    digit
  jmp   letter

digit:
  add   edx, 48
  mov   [ecx], BYTE dl ; reszta z dzielenia + numer znaku ASCII
  inc   ecx
  mov   ebx, eax
  cmp   ebx, 0
  je    end
  jmp   begin

letter:
  add   edx, 55
  mov   [ecx], BYTE dl ; reszta z dzielenia + numer znaku ASCII
  inc   ecx
  mov   ebx, eax
  cmp   ebx, 0
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
