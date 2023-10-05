#include <stdio.h>

/*
   Yuvan Rengifo
   I pledge my honor that I have abided by the Stevens honor System

   State the sorting algorithm you chose in task 3
   State if you want to be considered for bonus points in task 3
*/

void copy_str(char* src, char* dst) {
    /* Your code here */
    int i =0;         //char tracker
    
copy: 
dst[i] = src[i];    // copy char[i] 

if(src[i] == '\0'){ // if it reaches end of string, go to 'end' line
    goto end;
}
i++;            // increment i, ~go to next char~
goto copy;

end:        // end the program
return;
}

int dot_prod(char* vec_a, char* vec_b, int length, int size_elem) {
    /* Your code here
       Do not cast the vectors directly, such as
       int* va = (int*)vec_a;
    */
   int total = 0;   // result tracker
   int i =0;        // index tracker
   int a,b;         // elements [i] holder for each vector
   
dot:

//casting each element of the array
  a = *((int*) ((vec_a + (i * size_elem)))); 
  b = *((int*) ((vec_b + (i * size_elem)))); 
  

// Dot product formula + tracker
 total += (a * b);

// If we iterate throught the whole array return the total
 if (i==length){
   
    return total;
}

 i++; // Increment the index
 goto dot;  // Statement ~if~ isnt true yet so keep looping
}


void insertionSort(unsigned int* arr, int n) {      //Insertion sort algorith
    for (int i = 1; i < n; i++) {
        unsigned int key = arr[i];
        int j = i - 1;

        while (j >= 0 && arr[j] > key) {
            arr[j + 1] = arr[j];
            j--;
        }

        arr[j + 1] = key;
    }
}

void sort_nib(int* arr, int length) {
    /* Your code here*/ 

    int size_array = length * sizeof(arr); // the size of the array of hexadecimal bits
    int stay = (sizeof(arr) - 1) * sizeof(int); // the max bits to shift
    unsigned int arrB[size_array]; // new arr

    int i = 0; // iterates arrB
    int j = 0; // amount of bit shifts

    for (int k = 0 ; k < length; k++) {
        for (; j <= stay; j += 4) {
            arrB[i] = ((((unsigned int)arr[k]) << j) >> stay); // shifts bits to grab single bit
            i++;
        }

        j = 0;
    }

    insertionSort(arrB, size_array); // sorts array_of_bits

    i = 0; 
    j = stay; //  byte movement index
    
    unsigned int combine = 0; // new combined address
    for (int k = 0 ; k < length; k++) {
        for (; j >= 0; j -= 4) {
            combine = (arrB[i] << j) | combine; // inserts hex bits
            i++;
        }

        arr[k] = (int)combine; // modifies arr
        combine = 0;
        j = stay;
    }
}


int main(int argc, char** argv) {

    /**
     * Task 1
     */

    char str1[] = "382 is the best!";
    char str2[100] = {0};

    copy_str(str1,str2);
    puts(str1);
    puts(str2);
    
    

    /**
     * Task 2
     */

    int vec_a[9] = {148, -300, -73, 2, 466, -131, -151, 255, -251};
    int vec_b[9] = {376, 379, 442, -272, 470, -199, 9, -108, -244};
    int dot = dot_prod((char*)vec_a, (char*)vec_b, 9, sizeof(int));
    
    printf("%d\n",dot);

    /**
     * Task 3
     */

    int arr[3] = {0x12BFDA09, 0x9089CDBA, 0x56788910};
    sort_nib(arr, 3);
    for(int i = 0; i<3; i++) {
        printf("0x%x ", arr[i]);
    }
    puts(" ");

    return 0;
}
