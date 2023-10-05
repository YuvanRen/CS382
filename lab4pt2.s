.text
.global _start
.extern scanf

_start:
    ADR X0, fmt_str     // Load address of formated string
    ADR X1, left        // Load &left
    ADR X2, right       // Load &right
    ADR X3, target      // Load &target
    BL scanf            // scanf("%ld %ld %ld", &left, &right, &target);

    ADR X1, left        // Load &left
    LDR X1, [X1]        // Store left in X1
    ADR X2, right       // Load &right
    LDR X2, [X2]        // Store right in X2
    ADR X3, target      // Load &target
    LDR X3, [X3]        // Store target in X3

    /* Your code here */

    CMP X3, X1          // Compare target with left
    B.LT not_in_range   // Branch if target < left
    CMP X3, X2          // Compare target with right
    B.GT not_in_range   // Branch if target > right

    // Target is within the range

    MOV X0, 1       // Printing
    ADR X1, yes     // Load address of "yes" 
    ADR X3, len_yes // Load address of "len_yes"
    LDR X2, [X3]    // Load data of X3
    MOV X8, 64      // System call number for write
    SVC 0           // Invoke system call

    B exit // Branch to exit

not_in_range:

    // Target is not within the range

    MOV X0, 1       // Printing
    ADR X1, no      // Load address of "no"
    ADR X3, len_no  // Load address of "len_no"
    LDR X2, [X3]    // Load data of X3
    MOV X8, 64      // System call number for write
    SVC 0           // Invoke system call


exit:
    MOV X0, 0   /* status <- 0 */
    MOV X8, 93  /* exit()is system call #93 */
    SVC 0       /* invoke system call */

.data
    left:    .quad     0
    right:   .quad     0
    target:  .quad     0
    fmt_str: .string   "%ld %ld %ld"
    yes:     .string   "Target is in range\n"
    len_yes: .quad     . - yes  // Calculate the length of string yes
    no:      .string   "Target is not in range\n"
    len_no:  .quad     . - no   // Calculate the length of string no
