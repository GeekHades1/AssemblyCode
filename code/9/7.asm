; 实验9 分别显示绿色 绿底红色 白底蓝色的字符串 'welcome to masm!'

assume cs:code, ds:data

data segment
 db 'welcome to masm!'
data ends

code segment
 start: mov ax, 0B800H
		mov es, ax
		
		mov ax, data
		mov ds, ax
		
		mov si, 0
		;mov bx, 0A0H     ; 第二行
		mov bx, 0H
		mov cx, 16
		
		; 绿色	02H
	s:	mov al, [si]
		mov ah, 02h
		inc si
		mov es:[bx], ax
		add bx, 2
		loop s
		
		; 绿底红色 24H
		mov si, 0
		mov bx, 0A0H
		mov cx, 16
		
	s1: mov al, [si]
		mov ah, 24h
		inc si
		mov es:[bx], ax
		add bx, 2
		loop s1
		
		mov si, 0
		mov bx, 140H
		mov cx, 16
		; 白底蓝字 71H
	
	s2: mov al, [si]
		mov ah, 71h
		inc si
		mov es:[bx], ax
		add bx, 2
		loop s2
	
		
		mov ah, 0
		int 16h
		
		mov ax, 4c00H
		int 21h
code ends

end start