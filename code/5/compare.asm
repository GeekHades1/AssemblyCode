; 在Debug 下对 mov ax,[0] 的解释是 (ax) = (bs*16+0)
; 但是在masm 的解释中 会变成 mov ax, 0 即 (ax) = 0
; masm把[idata]当作是常量对待。如果需要向debug那样的
; 效果需要使用显示声明 mov ax, ds:[0];

assume cs:code
code segment
	mov ax, 2000h
	mov ds, ax
	mov al, [0]                         ; compare 1
	mov bl, ds:[0]                      ; compare 2
										; 0B28:0005 B000          MOV     AL,00
										; 0B28:0007 8A1E0000      MOV     BL,[0000]
	mov ax, 4c00h
	int 21h
	
code ends
end
