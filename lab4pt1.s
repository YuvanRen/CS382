/*
    Yuvan Rengifo
    I pledge my honor that I have abided by the Stevens Honor system
 */
 .text
.global _start
_start:
    ADR X4, side_a  // Load &side_a
    ADR X5, side_b  // Load &side_b 
    ADR X6, side_c  // Load &side_c

    LDR X4, [X4]    // Store side_a in X4
    LDR X5, [X5]    // Store side_b in X5
    LDR X6, [X6]    // Store side_c in X6

    MUL X4, X4, X4  // Store a^2 into X4
    MUL X5, X5, X5  // Store b^2 into X5
    MUL X6, X6, X6  // Store c^2 into X6

    ADD X7, X4, X5  // Store a^2 + b^2 into X7

    CMP X7, X6      // Check if a^2 + b^2 = c^2
    B.EQ tri        // If last line is true then go to tri

    MOV X0, 1       // Printing
    ADR X1, no      // Load address of "no"
    ADR X3, len_no  // Load address of "len_no"
    LDR X2, [X3]    // Load data of X3
    MOV X8, 64      // System call number for write
    SVC 0           // Invoke system call
    B end           // Go to end

tri:
 
    MOV X0, 1       // Printing
    ADR X1, yes     // Load address of "yes" 
    ADR X3, len_yes // Load address of "len_yes"
    LDR X2, [X3]    // Load data of X3
    MOV X8, 64      // System call number for write
    SVC 0           // Invoke system call

end: 
    MOV X0, 0   /* status <- 0 */
    MOV X8, 93  /* exit()is system call #93 */
    SVC 0       /* invoke system call */

.data
side_a: .quad 3
side_b: .quad 4
side_c: .quad 5
yes: .string "It is a right triangle.\n"
len_yes: .quad . - yes // Calculate the length of string yes
no: .string "It is not a right triangle.\n"
len_no: .quad . - no // Calculate the length of string no
