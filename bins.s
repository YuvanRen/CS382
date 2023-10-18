/**
 * Name:   Yuvan Rengifo
 * Pledge:  I pledge my honor that I have abided by the stevens honor system
 */

.text
.global _start

_start:
    ADR X0, arr         // Load address of array
    ADR X1, length      // Load address of length
    LDR X1, [X1]        // Value of length
    ADR X2, target      // Load address of target
    LDR X2, [X2]        // Value of target

    MOV X3, 0           // Left
    MOV X4, X1          // Right
   

search: 
    CMP X4, X3          // Compare right to left
    B.LT not_in_array   // Not in array

    ADD X5, X4, X3      // Add left and rigth to find middle
    LSR X5, X5, 1       // middle = (left + rigth) / 2 (shift once to divide by 2)
    LSL X9, X5, 3       // Multiply sum by size number (8)
    LDR X6, [X0 , X9]   // Load middle value

    CMP X2, X6          // Compare target to middle
    B.EQ in_array       // Target is the middle component

    B.LT left           // Target < middle search left side of array
   
    B.GT right          // Target > middle search right side
    
    B not_in_array

left:
    MOV X4, X5 
    SUB X4, X5, 1       // Rigth = mid Mid - 1

    B search

right:
    MOV X3, X5
    ADD X3, X5, 1       // Rigth = mid Mid - 1
    B search

in_array:
    // Target is in the array

    MOV X0, 1           // Printing
    ADR X1, msg1        // Load address of "msg1" 
    ADR X3, len_msg1    // Load address of "len_msg1"
    LDR X2, [X3]        // Load data of X3
    MOV X8, 64          // System call number for write
    SVC 0               // Invoke system call

    B exit // Branch to exit

not_in_array:

    // Target is not in the array

    MOV X0, 1         // Printing
    ADR X1, msg2      // Load address of "msg2"
    ADR X3, len_msg2  // Load address of "len_msg2"
    LDR X2, [X3]      // Load data of X3
    MOV X8, 64        // System call number for write
    SVC 0             // Invoke system call

exit:
    MOV X0, 0   /* status <- 0 */
    MOV X8, 93  /* exit()is system call #93 */
    SVC 0       /* invoke system call */

/*
 * If you need additional data,
 * declare a .data segment and add the data here
 */
 .data
msg1:    .string  "Target is in the array.\n"
msg2:    .string  "Target is not in the array.\n"
len_msg1: .quad . - msg1 // Calculate the length of string msg1
len_msg2: .quad . - msg2 // Calculate the length of string msg2
