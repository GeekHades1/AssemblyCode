; 使用栈的方式来做循环嵌套。
; 同样是把每一个字符变成大写

assume cs:code, ds:data, ss:stack

data segment
	db 'ibm             '
	db 'dec             '
	db 'dos             '
	db 'vax             '
data ends

stack segment
	dw 0, 0, 0, 0, 0, 0, 0, 0
stack ends

code segment

start:  mov ax, stack
		mov ss, ax
		mov sp, 10H
		mov ax, data
		mov ds, ax
		mov bx, 0
		
		mov cx, 4

s0:		push cx				; 将外循环的值放入栈中
		mov si, 0
		mov cx, 3			; 设置内循环的值
		
s:		mov al, [bx+si]
		and al, 0DFH
		mov [bx+si], al
		inc si
		loop s
		
		add bx, 10H
		pop cx				; 取出外循环的值
		loop s0
		
		mov ax, 4c00H
		int 21H
code ends

end start

; 0B28:0000  69 62 6D 20 20 20 20 20-20 20 20 20 20 20 20 20   ibm
; 0B28:0010  64 65 63 20 20 20 20 20-20 20 20 20 20 20 20 20   dec
; 0B28:0020  64 6F 73 20 20 20 20 20-20 20 20 20 20 20 20 20   dos
; 0B28:0030  76 61 78 20 20 20 20 20-20 20 20 20 20 20 20 20   vax

; 0B28:0000  49 42 4D 20 20 20 20 20-20 20 20 20 20 20 20 20   IBM
; 0B28:0010  44 45 43 20 20 20 20 20-20 20 20 20 20 20 20 20   DEC
; 0B28:0020  44 4F 53 20 20 20 20 20-20 20 20 20 20 20 20 20   DOS
; 0B28:0030  56 41 58 20 20 20 20 20-20 20 20 20 20 20 20 20   VAX