; 题目要求计算 123*256 的值。
; 使用汇编语言我们可以很清晰的看到计算机底层
; 到底是怎么样处理乘法的。
assume cs:code
code segment
	mov ax, 0
	mov cx, 256
s:  add ax, 123                     ; 进行256次加法
    loop s
	
	mov ax, 4c00H
	int 21H
code ends
end
