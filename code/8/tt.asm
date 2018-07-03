assume cs:code
;7C 47 05
code segment
mov dx, 5H
mov ax, 477cH
mov bx, 2258

div bx
mov ax, 4c00H
int 21H
code ends

end
