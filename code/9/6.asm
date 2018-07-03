; 实验8
assume cs:code

code segment

		mov ax, 4c00H
		int 21H
 start: mov ax, 0
	s : nop 
		nop
		
		mov di, offset s
		mov si, offset s2
		mov ax, cs:[si]
		mov cs:[di], ax         ; 这里的其实是把s2的地址给了s
		
	s0: jmp short s
	
	s1: mov ax, 0
		int 21H
		mov ax, 0
	
	s2: jmp short s1
		nop
		
code ends
end start
