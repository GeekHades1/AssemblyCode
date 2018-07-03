; 检测10.5

assume cs:code

stack segment
	dw 8 dup (0)
stack ends

code segment

start:	mov ax, stack
		;mov ss, ax
		;mov sp, 16
		mov ds, ax
		mov ax, 0
		call word ptr ds:[0eh]
		inc ax
		inc ax
		inc ax
		mov ah, 4ch
		int 21h
code ends

end start