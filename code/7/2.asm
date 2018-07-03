; 7.4 大小写转换的问题
; 假设我们有一段数据 'BaSic' 'iNfOrMaTiOn'
; 要将这第一个全变成大写，第二个全变成小写。再不用到判断的情况下
; 如何去完成这项工作。
; 下面来观察一下各个字母所对应的ASCLL码
;
;  大写    十六进制    二进制        小写    十六进制    二进制
;   A         41      0100 0001       a        61      0110 0001
;   B         42      0100 0010       b        62      0110 0010
;   C         43      0100 0011       c        63      0110 0011
; 
; 从上面的前三个英文字母可以看出大写字母的第五位都是为0（后5位足够表示26个字母）
; 小写的英文字母第五位都是1。所以我们可以使用and or 这两条位运算指令
; 来完成我们问题。
assume cs:code, ds:data
data segment
	db 'BaSic'
	db 'iNfOrMaTiOn'
data ends

code segment

start:  mov ax, data
		mov ds, ax
		mov bx, 0
		mov cx, 5
		
s1:     mov al, [bx]			; 将第一个串变成大写
		and al, 11011111b		; 只要将第五位变为0
		mov [bx], al
		inc bx 
		loop s1
		
		mov bx, 5				; 下一个串的偏移量
		mov cx, 11
s2:     mov al, [bx]
		or al, 00100000b		; 这里使用or，原因是因为大写的第五位不为0要将他变为0
		mov [bx], al
		inc bx
		loop s2
		
		mov ax, 4c00h
		int 21
	
code ends

end start

; 总结：如果要使得某一位变0就要使用and，变1则要使用or
; 修改前
; 0B28:0000  42 61 53 69 63 69 4E 66-4F 72 4D 61 54 69 4F 6E   BaSiciNfOrMaTiOn
; 修改后
; 0B28:0000  42 41 53 49 43 69 6E 66-6F 72 6D 61 74 69 6F 6E   BASICinformation
