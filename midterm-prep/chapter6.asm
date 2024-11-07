segment .data
a db 97
b db 98
c db 99
d db 100
quot db 0
rem db 0


segment .text
global main
main:
movsx rax, byte [a]
movsx rbx, byte [b]
movsx rcx, byte [c]
movsx rdx, byte [d]

add rax, rbx
add rax, rcx
add rax, rdx

mov rbx, 4
xor rdx, rdx
idiv rbx

ret