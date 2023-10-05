#include <stdio.h>
#include <stdint.h>
/*
Yuvan Rengifo
I pledge my honor that I have abided by the Stevens Honor System
*/
void display(int8_t bit) {
putchar(bit + 48);
}
void display_32(int32_t num) {
for (int i = 31; i >= 0; i--) {
int8_t bit = (num >> i) & 1; //each iteration of the loop, this line right-shifts the num by i positions
display(bit); // & 1 ensures the least signigicant b of the result is considered
}
putchar('\n');
}
int main(int argc, char constargv[]) {
display_32(420);
display_32(382);
display_32(-5);
display_32(2);
display_32(1);
return 0;
