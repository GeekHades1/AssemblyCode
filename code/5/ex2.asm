; 复制 mov ax, 4c00h之前的指令到 0200:0 中
assume cs:code
code segment

	mov ax, cs				; 填空
	mov ds, ax
	mov ax, 0020h
	mov es, ax
	mov bx, 0
	mov cx, 17h				; 填空
s:  mov al, [bx]
	mov es:[bx], al
	inc bx
	loop s
	mov ax, 4c00h
	int 21h
code ends
end
