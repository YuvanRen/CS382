/*
    Yuvan Rengifo
    I pledge my honor that I have abided by the Stevens Honor system
 */

.text
.global _start

_start:
    MOV X0, 1       /* destination for printing */
    ADR X1, msg     /* load memory address labeled as msg into X1*/
    ADR X3, len     /* load memory address labeled as len into X3 */
    LDR X2, [X3]    /* load the data of X3*/
    MOV X8, 64      /* system call for printing */

    SVC 0

    MOV X0, 0   /* status <- 0 */
    MOV X8, 93  /* exit()is system call #93 */
    SVC 0       /* invoke system call */

.data
    msg: .string "Hello World!\n"
    len: .quad 13
    