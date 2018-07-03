; 测试代码实际占用字节
assume cs:code

code segment
	dw 1234H
	; mov ax, 0
	mov ax, 4c00h
	int 21h
code ends

end
