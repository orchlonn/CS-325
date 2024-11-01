; Name: Orchlon Chinbat
; CWU ID: 50291063
; Honor Code: I pledge that this submission is solely my work, and that I have neither given, nor received help from anyone.

                section .data
x       db      -2, 4, 5          ; array of 3 values
y       db      -6                ; variable
quot    dq      0                 ; quotient
rem     dq      0                 ; remainder

         section .text
         global main
main:
        ; calculate the product of the values stored in 'x'
        movsx   rax, byte [x]         ; move 0-th element of 'x' (byte) to rax
        movsx   rbx, byte [x + 1]     ; move 1-st element of 'x' (byte) to rbx
        imul    rax, rbx              ; store the result of multiplying 'rax' and 'rbx' in rax
        movsx   rbx, byte [x + 2]     ; move 2-nd element of 'x' (byte) to rbx
        imul    rax, rbx              ; store the result of multiplying 'rax' and 'rbx' in rax
        
        ; Calculate final division
        movsx   rcx, byte [y]         ; move 'y' (byte) to rcx
        cqo                           ; 
        idiv    rcx                   ; divide the value in rax by the value in rcx

        mov     [quot], rax           ; store the quotient in the rax 
        mov     [rem], rdx            ; store the quotient in the rax
        
        cmovg   r8, [quot]        ; If the quotient is negative, move it to r8
        cmovl   r9, [quot]        ; If the quotient is positive, move it to r9
        
        xor     rax, rax          ; zero out the rax register
        xor     rbx, rbx          ; zero out the rbx register
        xor     rcx, rcx          ; zero out the rcx register
        xor     rdx, rdx          ; zero out the rdx register
        
        ret
        
