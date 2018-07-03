; 实验7

assume cs:code, ds:data, ss:stack

data segment
	db '1975', '1976', '1977', '1978', '1979', '1980'
	db '1981', '1982', '1983', '1984', '1985', '1986'
	db '1987', '1988', '1989', '1990', '1991', '1992'
	db '1993', '1994', '1995'
	; 21年 21个字符串
	
	dd 16, 22, 382, 1356, 2390, 8000, 16000, 24486, 50065
	dd 97479, 140417, 197514, 345980, 590827, 803530, 1183000
	dd 1843000, 3753000, 4649000, 5937000
	; 以上是21年公司总收入 21个dwrod数据
	
	dw 3, 7, 9, 13, 28, 38, 130, 220, 476, 778, 1001, 1442,
	dw 2258, 2793, 4037, 5635, 8226, 11542, 14430, 15257, 17800
	; 21年雇佣人数的21个word数据
data ends

table segment
	db 21 dup('year summ ne ?? ')
table ends

stack segment
	dw 8 dup(0)
stack ends

code segment
start:  	mov ax, data
			mov ds, ax
			; 获取数据偏移地址
			mov bx, 0
			mov di, 0A4H
			; 设置栈
			mov ax, stack
			mov ss, ax
			mov sp, 10H
			
			mov ax, table
			mov es, ax
			mov si, 0
			mov cx, 21
			; 获取年份
cptb:		mov ax, ds:[bx]					
			mov es:[si], ax
			mov ax, ds:[bx+2]
			mov es:[si+2], ax
			add si, 5
			; 获取总收入
			mov ax, ds:[bx+84]
			mov es:[si], ax
			push ax					; 收入低位入栈
			mov ax, ds:[bx+86]
			mov es:[si+2], ax
			push ax					; 收入高位入栈
			add si, 5
			; 获取雇员人数
			mov ax, ds:[di]
			mov es:[si], ax
			push ax					; 雇员人数入栈
			add si, 3
			; 计算人均收入
			pop es:[si]
			pop dx
			pop ax
			div word ptr es:[si]
			mov es:[si], ax
			add si, 3
			; 地址移动
			add bx, 4
			add di, 2
			loop cptb
			mov ax, 4c00H
			int 21H
code ends

end start