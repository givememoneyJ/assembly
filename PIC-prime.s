; PIC-prime.s
; sets RB7 high if prime, and low if not

list p=16f84            ;specify the micro controller used

#include <p16F84.inc>
    __CONFIG  _RC_OSC & _WDT_OFF & _PWRTE_OFF & _CP_OFF
    ; watchdog timer off,
    ; internal oscillator

VALUE equ 0Ch   
TEMP equ 0Dh     
DIVISOR equ 0Eh  


    org 0 ; reset vector
    ;bsf STATUS, 5
    ;movlw 3Fh ; set pins RB7 and RB6 to outputs
    goto init

init:
    banksel TRISB
    movlw 0
    movwf TRISB
    banksel PORTB
    bcf PORTB, 7
    bcf PORTB, 6
    bcf STATUS, 5

    

    
    movlw 13        ; Load the hardcoded number
    movwf VALUE     ; store it into a variable
    movlw 2         ; store the divisor
    movwf DIVISOR   ; store it into a variable
    movlw 0         ; temp storage
    movwf TEMP

    ; Test if the number is prime
    ; Set RB6 and RB7 accordingly



reset:
    movlw b'11111111'
    andwf VALUE, 0
    movwf TEMP
    movlw b'11111111'
    andwf DIVISOR, 0
    subwf VALUE, 0
    btfsc STATUS, 2
    goto prime
    movlw b'11111111'
    andwf DIVISOR, 0
    goto loop

loop:
    subwf TEMP, 1
    btfsc STATUS, 2
    goto notPrime
    BTFSS STATUS, 0
    goto incDiv
    goto loop

incDiv:
    incf DIVISOR
    goto reset

prime:
    movlw b'11000000'
    movwf PORTB
    goto done
notPrime:
    movlw b'01000000'
    movwf PORTB
    goto done
done:
    nop
    goto done
    end