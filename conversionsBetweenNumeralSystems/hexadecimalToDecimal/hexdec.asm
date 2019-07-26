;=====================================================================
; hexadecimal -> decimal
; od konca stringa do poczatku
;=====================================================================

section	.text
global  hexdec

hexdec:
	push	ebp
	mov		ebp, esp
	mov		ebx, [ebp+8] ; pierwotna wartosc - zrodlo (source) stad czytamy
  mov   [ebp-4],  DWORD 0 ; tutaj bedzie wynik
  mov   [ebp-8],  DWORD 1 ; tutaj jest wartosc domnazana przez znak heksadecymalny
  mov   [ebp-12], DWORD 16 ; tutaj jest mnoznik 16
  mov   ecx, 0

  cmp   [ebx], DWORD 0
  jz    end ; sprawdzamy czy string == null

; idziemy na koniec stringa
begin:
  mov   cl, [ebx]
  cmp		cl, 0
  je    loop
  inc   ebx
  jmp   begin

loop:
  dec   ebx
  mov   cl, [ebx]
	cmp   cl, '0'	; wszystkie cyfry hex w przedziale <'0'; 'f'>
	jl    continue
	cmp   cl, 'f' ; wszystkie cyfry hex w przedziale <'0'; 'f'>
	jg    continue
	cmp   cl, '9'
	jle   digit	; skok jesli w przedziale <'0'; '9'>
	cmp   cl, 'A'
	jl	  continue
	cmp   cl, 'F'
	jle   uppercase	; skok jesli w przedziale <'A'; 'F'>
	cmp   cl, 'a'
	jl	  continue
	jmp   lowercase ; do tego miejsca dochodzi jesli w przedziale <'a'; 'f'>

digit:
  mov   eax, DWORD [ebp-8]
  sub   cl, 48
  mul   DWORD ecx
  add   [ebp-4], eax
  jmp   continue

uppercase:
  mov   eax, DWORD [ebp-8]
  sub   cl, 55
  mul   DWORD ecx
  add   [ebp-4], eax
  jmp   continue

lowercase:
  mov   eax, DWORD [ebp-8]
  sub   cl, 87
  mul   DWORD ecx
  add   [ebp-4], eax
  jmp   continue

continue:
  mov   eax, DWORD [ebp-8]
  mul   DWORD [ebp-12]
  mov   [ebp-8], DWORD eax
  cmp   ebx, [ebp+8]
  je    end
  jmp   loop

end:
	mov		eax, DWORD [ebp-4]
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
