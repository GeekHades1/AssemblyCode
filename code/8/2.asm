; 8.5 指令处理数据长度
; 使用 X ptr 可以指定指令处理的内存单元是字 还是字节
; X 可以是 Word 或 Byte

assume cs:code

code segment

start:		mov ax, 2000H
			mov ds, ax
			mov bx, 0
			mov cx, 8H
			; 先初始化20000H的后八个字为FF
			
init:		mov ds:[bx], 0FFFFH
			add bx, 2
			loop init
			
			mov bx, 0
			; mov ds:[bx], 1H	; 这样是错误的，因为编译器不知道这是存储字还是字节
			mov ax, 1H
			mov ds:[bx], ax		; 存放一个字 01 00
			
			add bx, 2
			mov al, 1H
			mov ds:[bx], al		; 存放一个字节 01
			inc bx
			
			mov byte ptr ds:[bx], 1H ; 显示说明存放放一个字节，与第一个注释语句做区分
			inc bx
			
			mov word ptr ds:[bx], 1H ; 与 mov ds:[bx], ax相等价
			add bx, 2
			
			mov ax, 4c00H
			int 21H
code ends

end start

; 最后说明一点 PUSH 的操作是不用声明是字或是字节，因为PUSH只对字进行
; 操作，因为PUSH过后 SP = SP - 2