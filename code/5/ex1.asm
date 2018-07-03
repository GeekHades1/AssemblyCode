; 向内存 0:200-0:23f 依次传送数据0-3fh
assume cs:code
code segment

	mov ax, 0020h
	mov ds, ax
	mov bx, 0                  ; 清空累加器
	mov cx, 3fh                ; 循环次数

s:  mov [bx], bx
	inc bx
	loop s
	
	mov ax, 4c00h
	int 21h
code ends
end
