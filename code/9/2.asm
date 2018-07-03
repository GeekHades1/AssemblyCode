; 程序 9.3
assume cs:code

code segment

 start: mov ax, 0
		mov bx, 0
		jmp far ptr s
		db 256 dup (0)
	s:  add ax, 1
		inc ax
		
		mov ax, 4C00H
		int 21H
code ends

end start

; 0B28:0006 EA0B01280B    JMP     0B28:010B
; 0B28:000B 0000          ADD     [BX+SI],AL
; jmp 指令的偏移量等于目的地址-jmp指令后的第一个字节的地址
; 0100 = 256 , 下一条指令是 000B 所以 偏移量 010B - 000B = 0100