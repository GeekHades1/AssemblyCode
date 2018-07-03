; segment
; ends 是一段伪指令，意示着某个代码段。
; assume 是假设某一段寄存器和程序中的某一个用
; segment ... ends 关联的段。
assume cs:codesg            ; 
codesg segment				; 伪指令
	mov ax, 0123H
	mov bx, 0456H
	add ax, bx
	add ax, ax
	
	mov ax, 4c00H
	int 21H
codesg ends

end                        	; 汇编程序的结束标记
