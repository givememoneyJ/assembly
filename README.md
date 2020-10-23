# ERE Project 0 - "RISC Assembly Programming"
## Mason Faulkner

### MIPS
Compiled and Ran using QtSpim


### ARM
Compile:
> arm-linux-gnueabi-gcc ARM-prime.s -static -mcpu=cortex-a7

run:
> qemu-arm a.out

### PIC

Compile:
> gpasm .\PIC-prime.s

Run:
using gpsim


### Overview

Each assembly has different syntax and instruction sets that require diving into to learn the different functionality. Essentially the problem had to be broken down to see if a number could be divided evenly. Typically this is done with Modulo. With MIPS having a DIVIDE and remainder function built-in, it was the easiest to implement.

```
    div $t1, $t0          # i mod 2
    mfhi $t6              # temp for the mod
    beq $t6, 0, notPrime  # if mod == 0, print not prime
```

ARM required a special version to use `sdiv` but the remainder was lost. This would then need to be compared to the original number to see if it divided evenly.

```
    udiv r2, r1, r0    // divide (rounds off decimal)
    mul r2, r2, r0     // multiply by the divisor
    cmp r2, r1         // check to make sure they differ
    beq .notprimeroot
```

PIC was the hardest to implement since there was a lack of functions and comparisons compared to other assembly languages. To accomplish division for instance, the number would keep being subtracted until it was zero. If it was less than zero, the carry flag would be tripped, and then the next instruction would be skipped. All of these inside of a loop.


```
    subwf VALUE, 0
    btfsc STATUS, 2

```



### Conclusion

This assignment showed how different microcontroller assembly languages can be along with the ease of implementation.
