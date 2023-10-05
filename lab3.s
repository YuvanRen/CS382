/*
    Yuvan Rengifo
    I pledge my honor that I have abided by the Stevens Honor system
 */
.text
.global _start

_start:

    ADR X1, vec1        // Load the base memory address of vec1
    ADR X2, vec2        // Load the base memory address of vec2
    ADR X4, dot         // Load dot into X4
    MOV X5, 0           // Result tracker

    LDR X9, [X1, 0]     // First element of vec1
    LDR X10, [X2, 0]     // First element of vec2

    MUL X3, X9, X10      // Load the product of X9 and X10 into X3
    ADD X5, X5, X3      // ADD the product of the first elements of the vector to dot register

    LDR X9, [X1, 8]     // Override the last X9 value and make it the second element of vec1
    LDR X10, [X2, 8]     // Override the last X10 value and make it the second element of vec2

    MUL X3, X9, X10      // Load the product of X9 and X10 into X3
    ADD X5, X5, X3      // ADD the product of the first elements of the vector to dot register

    LDR X9, [X1, 16]    // Override the last X9 value and make it the third element of vec1
    LDR X10, [X2, 16]    // Override the last X10 value and make it the third element of vec2

    MUL X3, X9, X10      // Load the product of X1 and X2 into X3
    ADD X5, X5, X3      // ADD the product of the first elements of the vector to dot register

    STR X5,[X4,0]       // Load X5 back to dot variable

    SVC 0                /* invoke system call */

    MOV X0, 0   /* status <- 0 */
    MOV X8, 93  /* exit()is system call #93 */
    SVC 0       /* invoke system call */

.data
vec1: .quad 10, 20, 30
vec2: .quad 1, 2, 3
dot:  .quad 0
