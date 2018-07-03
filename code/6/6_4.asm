; 将数据、代码、栈放入不同的段中
assume cs:code, ds:data, ss:stack   ; 定义多个段
; 数据段
data segment 
	dw 0123h, 0456h, 0789h, 0abch, 0defh, 0fedh, 0cbah, 0987h
data ends
; 栈段
stack segment
	dw 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stack ends
; 代码段
code segment
start:	mov ax, stack
		mov ss, ax
		mov sp, 20h;		; 设置栈顶 2^5 = 32, 16个字单元
		
		mov ax, data
		mov ds, ax
		mov bx, 0
		mov cx, 8
s:		push [bx]
		add bx, 2
		loop s
		
		mov bx, 0
		mov cx, 8
s0:		pop [bx]
		add bx, 2
		loop s0
		
		mov ax, 4c00h
		int 21h
code ends

end start

; 程序加载后：DS=0B18  SS=0B28  CS=0B2B
