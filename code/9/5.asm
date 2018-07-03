; 检测点 9.2
; 利用jcxz来寻找2000H中第一个值为0的字节

assume cs:code

code segment
 start: mov ax, 2000H
		mov ds, ax
		mov bx, 0
	s:	mov cl, [bx]
		mov ch, 0
		jcxz ok
		add bx, 2
		jmp short s
	ok: mov dx, bx
		mov ax, 4c00H
		int 21H
		
code ends
end start
