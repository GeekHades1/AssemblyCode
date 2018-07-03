; loop指令的用法需要结合cx寄存器
; loop 标号, CPU执行loop指令的时候,要进行两步操作
; 1、(cx) = (cx) - 1. 2、判断cx的值是否为0，否则继续执行loop
; 现在演示2 ^ 12 与 loop 结合的计算程序
assume cs:codesg
codesg segment
	mov ax, 2
	mov cx, 11                    ; 因为这里要执行11次的 ax+ax
s:  add ax, ax					  ; 相当于算术左移
	loop s                        ; 进行循环判断
	
codesg ends
end