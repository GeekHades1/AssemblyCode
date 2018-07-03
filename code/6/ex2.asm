; 习题1的修改版 使用栈来完成修改数据
assume cs:code
code segment
		dw 0123h, 0456h, 0789h, 0abch, 0defh, 0fedh, 0cbah, 0987h
		dw 0, 0, 0, 0, 0, 0, 0, 0, 0, 0		; 十个单元作为栈空间
start:  mov ax, cs
		mov ss, ax
		mov sp, 24H 						; 偏移量为24H
		
		mov ax, 0
		mov ds, ax
		mov bx, 0
		mov cx, 8
s:      push [bx]
		pop cs:[bx]
		add bx, 2
		loop s
		
		mov ax, 4c00h
		int 21h
code ends
end	start

; 0:0 - 0:15数据内容
; 0000:0000  68 10 A7 00 8B 01 70 00-16 00 8E 03 8B 01 70 00
; 数据段:
; 0B28:0000  23 01 56 04 89 07 BC 0A-EF 0D ED 0F BA 0C 87 09
; 程序运行后数据段:
; 0B28:0000  68 10 A7 00 BB 13 3A 05-16 00 8E 03 B1 13 3A 05