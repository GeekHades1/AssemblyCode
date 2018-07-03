; move1的修改版 使用dx来进行字复制

assume cs:code
code segment
	mov bx, 0
	mov cx, 6				; 缩短为6次
	
s:  mov ax, 0ffffh
	mov ds, ax
	mov dx, [bx]
	
	mov ax, 0020h
	mov ds, ax
	mov [bx], dx
	
	inc bx					; 这里需要加两个单元
	inc bx
	
	loop s
	
	mov ax, 4c00h
	int 21h
	
code ends
end
