; 程序9.1
assume cs:code

code segment
start:  mov ax, 0
		jmp short s
		add ax, 1
s:		inc ax

		mov ax,4c00H
		int 21H
code ends

end start

; 0B28:0003 EB03          JMP     0008
; 机器码对应的是 EB03 只有指令代码并没有操作数
; CPU在执行jmp指令的时候并不需要转移的目的地址
; EB 03 03 代表的是据当前指令的偏移地址
