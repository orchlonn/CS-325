; Name: Orchlon Chinbat
; CWU ID: xxxxxxxx
; Honor Code: I pledge that this submission is solely my work, and that I have neither given, nor received help from anyone.

                section .data
x       db      -2, 4, 5          ; array of 3 values
y       db      -6                ; variable
quot    dq      0                 ; quotient
rem     dq      0                 ; remainder

         section .text
         global main
main:
        ; Move the initial value of x to rax and extend its sign.
        movsx   rax, byte [x]        ; rax = -2
        ; Move the second value of x to rax and extend its sign.
        movsx   rdx, byte [x + 1]    ; rdx = 4
        imul    rax, rdx             ; rax = rax * rdx (signed multiplication)
        ; Move the last value of x to rax and extend its sign.
        movsx   rdx, byte [x + 2]    ; rdx = 5
        imul    rax, rdx             ; rax = rax * rdx (signed multiplication)
        
                  
        ; Calculate final division         
        movsx   rcx, byte [y]         ; move 'y' (byte) to rcx
        xor rdx, rdx                  ; zero out rdx before the division
        cqo                           
        idiv    rcx                   ; divide the value in rax by the value in rcx
        mov     [quot], rax           ; Store the value of rax in quot      
        mov     [rem],  rdx           ; Store the value of rdx in rem 
        
        test    rax,    rax           ; Check if rax is zero or negative
        cmovg   r8,     [quot]        ; if the rax (quot) is positive, move rax to r8
        cmovl   r9,     [quot]        ; if the rax (quot) is negative, move rax to r9
        
        xor     rax, rax          ; zero out the rax register
        xor     rcx, rcx          ; zero out the rcx register
        xor     rdx, rdx          ; zero out the rdx register
        xor     r8, r8            ; zero out the r8 register
        xor     r9, r9            ; zero out the r9 register
        
        ret