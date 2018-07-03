; move2 的增强
; 使用段超越的方式来减少代码量

assume cs:code 
code segment
	mov bx, 0
	mov cx, 6
	
	mov ax, 0ffffh
	mov ds, ax
	
	mov ax, 0020h
	mov es, ax                        ; 段超越
s:  mov dx, [bx]
	mov es:[bx], dx
	
	inc bx
	inc bx
	loop s
	
	mov ax, 4c00h
	int 21h
	
code ends
end
