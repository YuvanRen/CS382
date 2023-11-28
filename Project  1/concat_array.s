/*  Name: Yuvan Rengifo
    Pledge: I pledge my honor that I have abided by the Stevens Honor System
 */

//.global _start
//_start:

.global concat_array

concat_array:
   // X0 = Array
   // X1 = Length of array 
   // X2 = Pointer to output string (concat_array_outstr)
   // X4 = Temporary for element size
   // X5 = Array[i] 
   // X6 = Array index
   // X7 = Temporary for ASCII conversion result
   // X8 = Temporary for space character

   SUB sp, sp, 48
   STR LR, [sp, 0]


   ADR X2, concat_array_outstr  // output string pointer
   MOV X11, 0                   // loop iterator
   MOV X6, 0                    // array index
   
loop:
   MOV X4, 0               // element size
   CMP X11, X1             // Compare loop index & length of array
   B.EQ done               // All elements were processed

   LDR X5, [X0, X6]        // Load Array Element (to find length of it)
   MOV X9, X5              // Copy Array Element (to change to ASCII)
   ADD X6, X6, 8           // Increment array index by 1 for byte elements
   
   STR X0, [sp, 8]
   STR X1, [sp, 16]        // Storing in stack
   STR X2, [sp, 24]
   STR X4, [sp, 32]

  // Convert Element to ASCII
   MOV X0, X9              // Load character to ascii parameter
   BL itoascii             // Call itoascii
   MOV X7, X0             // X7 will hold the start address of the ASCII string

   LDR X0, [sp, 8]
   LDR X2, [sp, 24]
   // Rest of the cleanup code

   // Copy ASCII characters
copy_loop:
   LDRB W9, [X7], 1      // Load a byte from buffer and post-increment X7
   CMP W9, #0            // check for null terminator
   B.EQ after
   STRB W9, [X2]        // Store a byte to concat_array_outstr and post-increment X2
   ADD X2, X2, 1        // pointer + 1
   B copy_loop

after:
   // Add space 
   MOV W8, #' '        // Load space character
   STRB W8, [X2]       // Store space and post-increment X2
   ADD X2, X2, 1       // pointer + 1
   ADD X11, X11, 1     // loop + 1

   B loop

done:
    ADR X0, concat_array_outstr         // Return address of concat_array_outstr

   LDR X1, [sp, 16]
   LDR X2, [sp, 24]
   LDR X4, [sp, 32]
   LDR LR, [sp, 0]
   ADD sp, sp, 48
   RET            
.data
    /* Put the converted string into concat_array_outstr,
       and return the address of concat_array_outstr */
    concat_array_outstr:  .fill 1024, 1, 0
   

