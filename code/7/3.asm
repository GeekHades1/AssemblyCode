; 使用[bx+idata]的方式进行数组的处理
; ds:[bx+idata] = ((ds)*16+(bx)+idata)
; 依然使用2中的例子,转换大小写
assume cs:code, ds:data

data segment
 db 'BaSic'
 db 'MinIX'
data ends

code segment
start:  mov ax, data
		mov ds, ax
		mov bx, 0
		mov cx, 5
		
s:		mov al, [bx]
		and al, 0DFh		; == 1101 1111
		mov [bx], al
		mov al, [5+bx]
		or al, 20H			; == 0010 0000
		mov [5+bx], al
		inc bx
		loop s
		
		mov ax, 4c00h
		int 21h
code ends

end start

; 需要注意的一点是：如果两个数组长度不一致就不能使用这种方法。