; 问题8.1 用div计算data段中第一个数据除以第二个
; 数据后的结果，商存在第三个数据的存储单元中

assume cs:code, ds:data
data segment
	dd 100001
	dw 100
	dw 0
data ends

code segment
start:  	mov ax, data
			mov ds, ax
			mov ax, ds:[0]			; ax 存低16位
			mov dx, ds:[2]			; dx 存高16位
			div word ptr ds:[4]
			mov ds:[6], ax			; 存商
			
			mov ax, 4c00H
			int 21H
code ends

end start
