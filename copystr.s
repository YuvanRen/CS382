/**
 * Name:   Yuvan Rengifo
 * Pledge:  I pledge my honor that I have abided by the stevens honor system
 */
.text
.global _start
_start:
 
       ADR  X0, src_str   // Store src address
       ADR  X1, dst_str   // Store dst address
       MOV  X2, 0         // String index tracker

loop:                       

       LDRB   W3, [X0,X2]  //Load x2-th character from src
       STRB   W3, [X1,X2]  // Store current character to string holder
       CBZ    W3, prnt     // If we reach the null terminator, jump to prnt
       ADD    X2, X2, 1    // Increment index
       B      loop         // Loop until reaching prnt
       

prnt:
    // Print dst
    ADD  X2, X2, 1    
    STRB W3, [X1, X2] //Store null

    MOV X0, 1       // Printing
    ADR X1, dst_str // Load address of dst
    MOV X8, 64      // System call number for write
    SVC 0           // Invoke system call

    MOV X0, 0   /* status <- 0 */
    MOV X8, 93  /* exit()is system call #93 */
    SVC 0       /* invoke system call */
/*
 * If you need additional data,
 * declare a .data segment and add the data here
 */


