; 使用内存中0:0-0:15改写程序中的数据
assume cs:code
code segment
		dw 0123h, 0456h, 0789h, 0abch, 0defh, 0fedh, 0cbah, 0987h
start:  mov ax, 0
		mov ds, ax
		mov bx, 0
		
		mov cx, 8
s:		mov ax, [bx]
		mov cs:[bx], ax
		add bx, 2
		loop s

		mov ax, 4c00h
		int 21h
code ends
end start

; 内存中 0:0 - 0:15数据
; 0000:0000  68 10 A7 00 BB 13 3A 05-16 00 8E 03 B1 13 3A 05
; 数据段
; 0B28:0000  23 01 56 04 89 07 BC 0A-EF 0D ED 0F BA 0C 87 09

; 修改后的数据段
; 0B28:0000  68 10 A7 00 BB 13 3A 05-16 00 8E 03 B1 13 3A 05