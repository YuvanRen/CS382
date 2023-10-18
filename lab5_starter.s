/*
    Yuvan Rengifo
    I pledge my honor that I have abided by the Stevens honor system

 */
.text
.global _start
.extern printf

/* char _uppercase(char lower) */
_uppercase:
    /* Your code here 
    
        You must follow calling convention,
        and make this a procedure.
    
    */
    SUB sp, sp, 8       // Char pointer 
    STR X30, [sp]

    SUB W1, W1, 32      // Convert to uppercase
    STRB W1, [X0, X3]   // Store the uppercase character back

    LDR X30, [sp]
    ADD sp, sp, 8
    RET

/* int _toupper(char* string) */
_toupper:
    /* Your code here 

        You must call _uppercase() for every character in string.
        Both loop and recursion are good.

        You must follow calling convention,
        and make this a procedure.

    */
    SUB sp, sp, 11      // Frame_size
    MOV X3, 0           // Character tracker
    STR X30, [sp]
loop:
    LDRB W1, [X0, X3]   // Load each character into W0 and convert to uppercase
    CBZ W1, end         // If null was reached, return
    BL _uppercase       // Call _uppercase for every character
    ADD X3, X3, 1       // Number of characters/tracker
    B loop              // Loop to the next character

end:
    LDR X30, [SP]
    ADD sp, sp, 11      
    RET

_start:
    /* You code here:

        1. Call _toupper() to convert str;
        2. Call printf() to print outstr to show the result.
    
    */
    // Load the address of the input string into X0
    ADR X0, str

    BL _toupper
    ADR X0, outstr
    MOV X1, X3
    ADR X2, str
    BL printf


    // Exit the program
    MOV X8, 93
    SVC 0

.data
str:    .string   "helloworld"
outstr: .string   "Converted %ld characters: %s\n"
