; 123*256 需要执行256次的123相加，计算次数太多
; 现在换另外一种思考模式 进行 123次的256相加。

assume cs:code
code segment

	mov ax, 0
	mov cx, 123
s:  add ax, 256
	loop s
	
	mov ax, 4c00H
	int 21H
code ends
end
