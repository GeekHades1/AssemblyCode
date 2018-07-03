; 6.1的修改版，6.1无法直接运行，因为程序的入口并不是合法指令
; 这里修改标记程序入口，end指令不仅能够通知编译器程序结束
; 而且还可以通知编译器入口位置
assume cs:code
code segment
	dw 0123h, 0456h, 0789h, 0abch, 0defh, 0fedh, 0cbah, 0987h
	
start:	mov bx, 0
		mov ax, 0
	
		mov cx, 8
s:  	add ax, cs:[bx]
		add bx, 2				; bx += 2, 好傻以前为什么没想到
		loop s
	
		mov ax, 4c00h
		int 21h
	
code ends
end start

	