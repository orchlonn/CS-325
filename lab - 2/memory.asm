; question 1
        segment .data
a       db      76
b       dw      76
c       dd      76.1234
d       dd      20.123
e       dd      0x172F2

; question 2
        segment .bss
g       resw    20 
h       resb    30
i       resd    5

        section .text
        global  main        ; let the linker know about main
main:
        push    rbp         ; set up a strack frame for main
        mov     rbp, rsp    ; let rbp point to the previous ssp
        sub     rsp, 16     ; leave some room for local variables
                            ; and align stack to 16 byte boundary
        xor     eax, eax    ; set rax to 0 for return value
        leave               ; undo the stack manipulations
        ret
        
        

