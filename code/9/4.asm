; 检测点 9.1 2
assume cs:code

data segment
	dd 12345678H
data ends

code segment
 start: mov ax, data
		mov ds, ax
		mov bx, 0
		mov [bx], word ptr 0		; 修改IP
		mov [bx+2], cs				; 修改cs
		jmp dword ptr ds:[0]
		
		mov ax, 4c00H
		int 21H
code ends

end start