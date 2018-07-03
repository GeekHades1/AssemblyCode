; 当CPU执行ret指令的时候相当于进行
; POP IP  从栈中读取数据
; 当CPU执行retf指令的时候相当于进行
; POP IP
; POP CS
; 故ret, retf与栈有直接关系

assume cs:code

data segment
	db 'Welcome to ASM!','$'
data ends

stack segment
	db 16 dup (0)
stack ends

code segment
		mov ah, 4ch
		int 21h

start:  mov ax, stack
		mov ss, ax
		mov sp, 16
		mov ax, 0
		push ax
		mov ax, data
		mov ds, ax
		mov bx, 0
		lea dx, [bx]   ; 正常显示 dx并没改变 在实际执行才会将bx存入dx中
		;mov dx, offset ds:[bx]
		mov ah, 09H
		int 21H
		ret				; IP = 0 

code ends

end start