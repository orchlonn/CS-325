; Name: Orchlon Chinbat
; CWU ID: xxxxxxxx
; Honor Code: I pledge that this submission is solely my work, and that I have neither given, nor received help from anyone.

                segment .data
a       dw      -4, 22, 144       ; word array (16-bit values)
b       db      -3, -16, 12       ; byte array (8-bit values)
result  dq      0                 ; memory location for result (64-bit)

         segment .text
         global main
main:
        ; for index = 0
        movsx  rax, word [a]      ; move 0-th element of 'a' (word) to rax
        add    rax, -3            ; add -3 to the value in rax
        movsx  rbx, byte [b]      ; move 0-th element of 'b' (byte) to rbx
        sub    rbx, 14            ; subtract 14 from the value in rbx
        add    [result], rax      ; add the value in rax to the result
        add    [result], rbx      ; add the value in rbx to the result
        
        ; for index = 1
        movsx  rax, word [a + 2]  ; move 1-st element of 'a' (word) to rax; offset by 2 bytes for word size
        add    rax, -3            ; add -3 to the value in rax
        movsx  rbx, byte [b + 1]  ; move 1-st element of 'b' (byte) to rbx; offset by 1 byte for byte size
        sub    rbx, 14            ; subtract 14 from the value in rbx
        add    [result], rax      ; add the value in rax to the result
        add    [result], rbx      ; add the value in rbx to the result

        ; for index = 2
        movsx  rax, word [a + 4]  ; move 2-nd element of 'a' (word) to rax; offset by 4 bytes for 2-word size
        add    rax, -3            ; add -3 to the value in rax
        movsx  rbx, byte [b + 2]  ; move 2-nd element of 'b' (byte) to rbx; offset by 2 bytes for 2-byte size
        sub    rbx, 14            ; subtract 14 from the value in rbx
        add    [result], rax      ; add the value in rax to the result
        add    [result], rbx      ; add the value in rbx to the result
       
        xor     rax, rax          ; zero out the rax register
        xor     rbx, rbx          ; zero out the rbx register
        
        ret
        
