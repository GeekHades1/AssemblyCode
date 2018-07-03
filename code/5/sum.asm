; 使用loop 累加ffff:0 - ffff:b 存储单元中的和
; 注意使用 al 可能会溢出，需要使用ax。
; 但是读取的是字节而不是字,所以需要使用内存单元相加
; (dx) = (dx)+内存中的八位数据
; (dl) = (dl)+内存中的八位数据

assume cs:code
code segment
	mov ax, 0ffffh
	mov ds, ax
	mov bx, 0					; 初始化ds:bx指向ffff:0
	mov dx, 0					; 初始化累加器
	mov cx, 12                  ; 一共有12个存储单元，循环12次

s:  mov al, [bx]
	mov ah, 0
	add dx, ax					; 间接向dx中加上((ds)*16+(bx))单元中的数据
	inc bx						; 使bx指向下一个目标位置
	loop s
	
	mov ax, 4c00h
	int 21h
code ends
end
