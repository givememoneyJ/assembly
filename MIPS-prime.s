

# Takes the odd integers from 1 to 9, adds them,
#  and spits out the result.
# main/driver starts here
    .globl main

main:

#data segment
.data

Li:     .byte 0x02  # i = 2
Lj:     .byte 0x09  # hard code a number
msg1:   .asciiz "NOT PRIME"
msg2:   .asciiz "PRIME"
        .extern foobar 4

# text segment
.text

        lb $t0, Li            # temp reg for i
        lb $t1, Lj            # hard coded number

L1:     beq $t0, $t1, Prime   # while i < 9, compute
        div $t1, $t0          # i mod 2
        mfhi $t6              # temp for the mod
        beq $t6, 0, notPrime  # if mod == 0, print not prime
        add $t0, $t0, 1       # i++
        j L1                  # repeat the while loop


Prime: 
        li $v0, 4             # syscall 4 (print_str)
        la $a0, msg2          # argument: string
        syscall               # print the string
        lw $t1, foobar
        li $v0, 10            # exit
        syscall

notPrime:  
        li $v0, 4             # syscall 4 (print_str)
        la $a0, msg1          # argument: string
        syscall               # print the string
        lw $t1, foobar
        li $v0, 10            # exit
        syscall