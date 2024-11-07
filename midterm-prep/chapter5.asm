        segment .data
a db 1
b dw 1000
c dd 100000
d dq 1 
sum dq 0
        segment .text
        global main
main:
movsx  rax, byte [a]      
movsx rbx, word [b]
add rax, rbx
movsxd rcx, [c]
add rax, rcx
mov rdx, [d]
add rax, rdx
mov [sum], rax
ret