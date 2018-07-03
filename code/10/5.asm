; 设计一个子程序 将小写字符转换成大写字母

assume cs:code

data segment
astr	db 'welcome to asm!', 0dh,0ah, '$'
data ends
; 只有0dh的时候输出的结果
; WELCOME TO ASM!
; 只有0ah的时候输出的结果
; welcome to asm!
;               WELCOME TO ASM!

code segment
start:		mov ax, data
			mov ds, ax
			mov si, 0
			mov cx, 14
			; 先打印原来内容
			call print
			call translet
			; 在打印转换内容
			call print
			mov ah, 4ch
		    int 21h
; 字符转换程序
; 将小写转换成大写
translet:	sub byte ptr [si], 32
			inc si
			loop translet
			ret
; 输出字符串ASTR
print:		lea dx, astr
			mov ah, 09h
			int 21h
code ends


end start