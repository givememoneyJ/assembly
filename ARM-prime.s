text
.global main

main:
    mov r0, #2  
    mov r1, #23

    cmp r1, #2
    beq .prime
    cmp r1, #1
    beq .prime
    b .loop

.loop:
    cmp r0, r1
    beq .prime
    udiv r2, r1, r0
    mul r2, r2, r0
    cmp r2, r1
    beq .notprimeroot
    add r0, r0, #1
    b   .loop

.notprime:
    mov r0, #1
    ldr r1, =message2
    ldr r2, =len2
    mov r7, #4
    swi 0

    mov r7, #1
    swi 0

.prime:
    mov r0, #1
    ldr r1, =message1
    ldr r2, =len1
    mov r7, #4
    swi 0

    mov r7, #1
    swi 0

.data
message1:
    .asciz "PRIME"
len1 = .-message1

message2:
    .asciz "NOT PRIME"
len2 = .-message2

