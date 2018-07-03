; 解决子程序与主程序寄存器使用冲突的问题

assume cs:code

data segment
	db 'word', 0, '$'
	db 'unix', 0, '$'
	db 'wind', 0, '$'
	db 'good', 0, '$'
data ends

stack segment
	dw 8 dup(0)
stack ends

code segment

start:		mov ax, stack
			mov ss, ax
			mov sp, 16
			
			mov ax, data
			mov ds, ax
			mov si, 0
		
			mov cx, 4
	s:  	mov si, bx
			call print
			call translet
			call print
			add bx, 6
			loop s
		
			mov ah, 4ch
			int 21h
; 转换程序 
translet:
			push cx
			push si
		
 change:	mov cl,[si]
			mov ch, 0
			jcxz ok
			and byte ptr [si], 11011111b
			inc si
			jmp change
			
	 ok:	pop si
			pop cx
			ret
; 打印字符串
;
print:		push dx
			push ax
			
			lea dx, [bx]
			mov ah, 09h
			int 21h
			
			call print_return
			
			pop ax
			pop dx
			ret
;---------------------------
;|		换行子程序		   |
;---------------------------			
print_return:	push dx
				push ax
				
				mov ah, 02h
				mov dl, 0dh
				int 21h
				
				mov ah, 02h
				mov dl, 0ah
				int 21h
				
				pop ax
				pop dx
				ret
code ends



end start
