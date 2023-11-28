/*  Name: Yuvan Rengifo
    Pledge: I pledege my honor that i have abided by the Stevens Honor System
 */

.global count_specs
                
count_specs:
    // X0 = Input string
    // X10 = %a counter
    // X12 = Current Character
    // X13 = Next Character
    // X14 = Char tracker
    // X15 = X14 + 1
    SUB sp, sp, 64

    STR X0, [sp, 0]
    STR X10, [sp, 8]
    STR X12, [sp, 16]
    STR X13, [sp, 32]    // Storing in stack
    STR X14, [sp, 40]
    STR X15, [sp, 48]

    STR X30, [sp, 56]


    MOV X14, 0          // Char Tracker
    MOV X10, 0
loop: 
    LDRB W12, [X0, X14] // Load character
    CBZ W12, done       // Null terminator (finished)

    //Check if character is %
    CMP W12, #'%'
    B.EQ yes2

    ADD X14, X14, 1     // Go to next character
    B loop
yes2:
    //Check if next character is 'a'
    MOV X15, X14
    ADD X15, X15, 1      // Stay char ahead

    LDRB W13, [X0, X15]  // Loads str[curr+1]
    CMP W13, #'a'
    B.EQ conf2

    ADD X14, X14, 1
    B loop

conf2:
    //Has '%a'
    ADD X10, X10, #1    // Increment counter
    ADD X14, X14, 2
    B loop

done:

    MOV X0, X10         // Counter -> Result

    LDR X12, [sp, 16]
    LDR X13, [sp, 32]
    LDR X14, [sp, 40]   // loading from stack
    LDR X15, [sp, 48]
    LDR X30, [sp, 56]

    ADD sp, sp, 64
    RET

/*
    Declare .data here if you need.
*/

