/**
 * Name:   Yuvan Rengifo
 * Pledge:  I pledge my honor that I have abided by the stevens honor system
 */

.text
.global _start

_start:
     ADR X1, numstr

    MOV X2, 0           // dw
    MOV X5, #1          // Multiplier
    MOV X3, #0          // Temporary storage
    MOV X6, #10         // 10 Base

dwabit:
    LDRB W4, [X1, X2]
    CBZ W4, atoi
    SUB W4, W4, #'0'    // Convert ASCII digit to integer
    MUL X3, X3, X6
    ADD X3, X3, X4
    ADD X2, X2, 1
    B dwabit

atoi:
    ADR X0, number      // Load the address of "number" into X0
    STR X3, [X0]        // Store the result in "number"

/* Do not change any part of the following code */
exit:
    MOV  X0, 1
    ADR  X1, number
    MOV  X2, 8
    MOV  X8, 64
    SVC  0
    MOV  X0, 0
    MOV  X8, 93
    SVC  0
    /* End of the code. */


/*
 * If you need additional data,
 * declare a .data segment and add the data here
 */

