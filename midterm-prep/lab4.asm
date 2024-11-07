segment .data
x       db      -2, 4, 5          ; array of 3 values
y       db      -6                ; variable
quot    dq      0                 ; quotient
rem     dq      0                 ; remainder

; x!/y

segment .text
global main
main:
movsx rax, byte [x]
movsx rbx, byte [x + 1]
imul rax, rbx
movsx rbx, byte [x + 2]
imul rax, rbx

movsx rbx, byte [y]
xor rdx, rdx
cqo
idiv rbx

test rax, rax
cmovl r9, rax
cmovg r8, rax

mov [rem], rdx
mov [quot], rax

xor rax, rax
xor rdx, rdx
xor rbx, rbx
xor r8, r8
xor r9, r9

ret