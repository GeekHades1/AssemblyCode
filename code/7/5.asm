; 实验6
; 将data段的每个单词的前四个字母变成大写
assume cs:code, ds:data, ss:stack

stack segment
	dw 0, 0, 0, 0, 0, 0, 0, 0
stack ends

data segment
	db '1. display      '
	db '2. brows        '
	db '3. replace      '
	db '4. modify       '
data ends

code segment
start:  ; 设置栈
		mov ax, stack
		mov ss, ax
		mov sp, 10H
		
		mov ax, data
		mov ds, ax
		mov bx, 0
		
		mov cx, 4
		
s0:		push cx
		mov si, 0
		mov cx, 4			; 设置内循环
		
s:		mov al, [bx+3+si]
		and al, 0DFH
		mov [bx+3+si], al
		inc si
		loop s
		
		add bx, 10H
		pop cx
		loop s0
		
		mov ax, 4C00H
		int 21H
code ends

end start

; 修改前
; 0B28:0010  31 2E 20 64 69 73 70 6C-61 79 20 20 20 20 20 20   1. display
; 0B28:0020  32 2E 20 62 72 6F 77 73-20 20 20 20 20 20 20 20   2. brows
; 0B28:0030  33 2E 20 72 65 70 6C 61-63 65 20 20 20 20 20 20   3. replace
; 0B28:0040  34 2E 20 6D 6F 64 69 66-79 20 20 20 20 20 20 20   4. modify

; 修改后
; 0B28:0010  31 2E 20 44 49 53 50 6C-61 79 20 20 20 20 20 20   1. DISPlay
; 0B28:0020  32 2E 20 42 52 4F 57 73-20 20 20 20 20 20 20 20   2. BROWs
; 0B28:0030  33 2E 20 52 45 50 4C 61-63 65 20 20 20 20 20 20   3. REPLace
; 0B28:0040  34 2E 20 4D 4F 44 49 66-79 20 20 20 20 20 20 20   4. MODIfy