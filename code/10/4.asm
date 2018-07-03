; 10.10 设计子程序 计算N的三次方

assume cs:code
data segment
	dw 1, 2, 3, 4, 5, 6, 7, 8
arr	dd 8 dup (0)
data ends

code segment
start: 	mov ax, data
		mov ds, ax
		mov si, 0
		mov di, offset arr
		
		mov cx, 8
	s:  mov bx, [si]
		call cube
		mov [di], ax
		mov [di+2], dx
		add si, 2
		add di, 4
		loop s
	
		mov ah, 4cH
		int 21h
	
cube:	mov ax, bx
		mul bx
		mul bx
		ret
		
code ends

end start