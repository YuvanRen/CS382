
/*  Name: Yuvan Rengifo
    Pledge: I pledege my honor that I have abidede by the Stevens Honor System
 */

.global pringle

pringle:
    //X0 = String
    //X7 = str[i]
    //X8 = str[i + 1]
    
    MOV X5,X0       // New String storage
    MOV X6, 0       // string index


    // Count ammount of Params, X0 already String
    BL count_specs  // Counts number of params in string
    MOV X9, X0      // Load number of ... to X9

loop:
    LDRB W7, [X5, X6]  // Load character
    CBZ W7, done       // Null terminator (finished)

    //Check if character is %
    CMP W7, #'%'
    B.EQ yes
  
    ADD X6, X6, 1      // Increment and loop for next character

    B loop

yes:
    //Check if next character is 'a'
    ADD X11, X11, X6
    ADD X11, X11, 1    // str[i + 1]

    LDRB W8, [X5, X11]  // Loads str[i + 1]
    CMP W8, #'a'
    B.EQ conf
    ADD X6, X6, 2
    B loop

conf:
    //Its '%a'
    //Fetch Array
    MOV X1, X9         
    BL concat_array
    MOV X10, X0     // Full Array

    STRB W10, [X5, X6]       // OverWrite %
    STRB WZR, [X5, X11]      // Delete a
    ADD X6, X6, 2             // Index + 2 

    ADD X12, X12, 1          // param tracker
    CMP X9, X12              // Worked all parameters
    B.EQ done
    //Else loop
    B loop

done:
    MOV X0, X5              // Load new string


/*
    Declare .data here if you need.
*/
