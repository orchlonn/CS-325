segment .data
a dw -4, 22, 144
b db -3, -16, 12
result dq 0 

; (-3 + a) + (b - 14)

segment .text
global main
main:
; load 1 st elements of an array
movsx rax, word [a] 
movsx rbx, byte [b]
add rax, -3
sub rbx, 14
add [result], rbx
add [result], rax

; load 2nd elements of an array
movsx rax, word [a + 2] 
movsx rbx, byte [b + 1]
add rax, -3
sub rbx, 14
add [result], rbx
add [result], rax

; load 3rd elements of an array
movsx rax, word [a + 4] 
movsx rbx, byte [b + 2]
add rax, -3
sub rbx, 14
add [result], rbx
add [result], rax

ret