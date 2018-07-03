; 寄存器的应用再讨论
assume cs:code

code segment
start:  mov ax, 1000H
		mov bx, 1002H
		
		mov ds, ax
		mov si, 10H
		mov cx, 10H
		
		mov ax, [bx]		; 将((ds)*16+(bx))内容传输给ax
		mov ax, [bx+si]		; 将((ds)*16+(bx)+(si))内容传输给ax
		
		;mov ax, [cx]		; error A2048: Must be index or base register
		; 当使用bp(Base pointer)当作寻址时段地址默认是ss
		mov bp, 2000H
		mov ax, [bp]
		
		;add ds:[bx], [bp]	; error A2052: Improper operand type
		;mov ax, [bx+bp]	; error A2046: Multiple base registers
		
		mov ax, 4c00H
		int 21H
code ends

end start