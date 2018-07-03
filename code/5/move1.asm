; 将内存ffff:0-ffff:b中的数据一个个的复制到0:200-0:20b中
; 这是采用字节移动的方法

assume cs:code
code segment
	mov bx, 0
	mov cx, 12
	
s:  mov ax, 0ffffh				; 初始化地址
	mov ds, ax					
	mov dl, [bx]
	
	mov ax, 0020h
	mov ds, ax
	mov [bx], dl
	
	inc bx
	loop s

	mov ax, 4c00h
	int 21h

code ends
end
