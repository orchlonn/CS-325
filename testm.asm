; Version 1

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
        ; Move the first element of x into rax and extend its sign.
        movsx   rax, byte [x]         ; rax = -2
        
        ; Move the second element of x into rdx and extend its sign.
        movsx   rdx, byte [x + 1]     ; rdx = 4
        ; To perform unsigned multiplication with `mul`, 
        ; move `rdx` into `rcx` and use `rax` as the multiplicand
        mov     rcx, rdx              ; rcx = 4 (copy rdx to rcx)
        mul     rcx                   ; rax = rax * rcx (rax *= 4)

        ; Move the first element of x into rdx and extend its sign.
        movsx   rdx, byte [x + 2]     ; rdx = 5
        ; Again, move `rdx` to `rcx` and perform the next multiplication
        mov     rcx, rdx              ; rcx = 5 (copy rdx to rcx)
        mul     rcx                   ; rax = rax * rcx (rax *= 5)

        
        ; Calculate final division
         
        movsx   rcx, byte [y]         ; move 'y' (byte) to rcx
        xor rdx, rdx
        cqo                           ; 
        idiv    rcx                   ; divide the value in rax by the value in rcx

        mov     [quot], rax           ; store the quotient in the rax
        
        
        
        mov     [rem], rdx
        test    rax,    rax
        cmovg   r8,     [quot]
        cmovl   r9,     [quot] 
        ;Neg     rdx
        ;test rax, rax 
        ;mov rax, -1
        ;mov  rcx, 1         ; Move -1 into a temporary register

        ;cmovg rax, rax
        ;cmovl rax, rcx
        ;imul rdx
        ;mov byte[rem], rdx
        
        
        
        
        
        ;cmovl   rdx, rcx        ; Conditionally move -1 into rdx if the condition is met

        ;mov     [rem], rax            ; store the quotient in the rax
        
        ;cmovg   r8, [quot]        ; If the quotient is negative, move it to r8
        ;cmovl   r9, [quot]        ; If the quotient is positive, move it to r9
        
        xor     rax, rax          ; zero out the rax register
        xor     rcx, rcx          ; zero out the rcx register
        xor     rdx, rdx          ; zero out the rdx register
        xor     r8, r8            ; zero out the r8 register
        xor     r9, r9            ; zero out the r9 register
        
        ret
        



; Version 2

; Name: Orchlon Chinbat
; CWU ID: 50291063
; Honor Code: I pledge that this submission is solely my work, and that I have neither given, nor received help from anyone.

                section .data
x       db      -2, 4, 5          ; array of 3 values
y       db      6                ; variable
quot    dq      0                 ; quotient
rem     dq      0                 ; remainder

         section .text
         global main
main:
        ; 
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
        
