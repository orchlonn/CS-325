        segment .data
   a   dw  -4, 22, 144
   b   db  -3, -16, 12   
   c   dd  1234
   res dq  0

        segment .text  
        global  main
main:
    ; for index = 1
    movsx rax, word [a]
    movsx rbx, byte [b]
    add rax, -3
    sub rbx, 14
    add [res], rbx
    add [res], rax
    
    ; for index = 2
    movsx rax, word [a + 2]
    movsx rbx, byte [b + 1]
    add rax, -3
    sub rbx, 14
    add [res], rbx
    add [res], rax
    
    ; for index 3
    movsx rax, word [a + 4]
    movsx rbx, byte [b + 2]
    add rax, -3
    sub rbx, 14
    add [res], rax
    add [res], rbx
    
    ; final addition
    movsxd rdx, [c]
    add [res], rdx
    
    xor rax, rax
    xor rbx, rbx
    xor rdx, rdx
    ret