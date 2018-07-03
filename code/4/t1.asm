assume cs:codesg
codesg segment

	mov ax, 2000H                     ; 这里注意要加H，不然就会被认为是十进制的数
	                                  ; 与debug底下不大相同
	mov ss, ax
	mov sp, 0
	add sp, 10
	pop ax
	pop bx
	push ax
	push bx
	pop ax
	pop bx
	
	mov ax, 4c00H
	int 21H
	
codesg ends

end