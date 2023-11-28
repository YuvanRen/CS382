
/*  Name: Yuvan Rengifo
    Pledge: I pledge my honor that I have abided by the Stevens Honor System
 */

.global itoascii

itoascii:
   SUB sp, sp, 64
   STR X0, [sp, 0]
   STR X19, [sp, 8]
   STR X20, [sp, 16]
   STR X21, [sp, 32]      // Storing in stack
   STR X22, [sp, 40]          
   STR X23, [sp, 48]
   STR X30, [sp,56]

   ADR X20, buffer
   STR XZR, [X20]        // Make Sure Buffer is clear
   
   MOV X19, X0           // Temp number
   MOV X21, 0            // Length of number
   MOV X10, 10           // Immi

   // Calculate the length of the number 
ilen:
   UDIV X19, X19, X10
   ADD X21, X21, 1
   CBNZ X19, ilen        // while(temp != 0)

   MOV X19, X0          // Load number back

   // Add length to the buffer
   ADD X20, X20, X21

conv:
   // "Mod10"
   UDIV X23, X19, X10   // a/10
   MUL X22, X23, X10    // 10 * (a/10)
   SUB X22, X19, X22    // (a - (10 * (a/10)))

   // ToASCII
   ADD W22, W22, #48    
   SUB X20, X20, 1
   STRB W22, [X20]      // Store ASCII into buffer
   MOV X19, X23

   CBNZ X23, conv        // Continue until number becomes 0
end:  
   ADR X0, buffer

   
   LDR X19, [sp, 8]
   LDR X21, [sp, 32]
   LDR X22, [sp, 40]
   LDR X23, [sp, 48]

   LDR X30, [sp,56]
   ADD sp, sp, 64
   RET

.data
    /* Put the converted string into buffer,
       and return the address of buffer */
    buffer: .fill 128, 1, 0
