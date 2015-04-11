#include "../../src/kern/video/tty.h"

void main ( void ) {
    tty_clearVideoMemory ( ) ;
    tty_printString ( 0x0F , "Hello, Kernel! I'm testing the way newline works by going overline and screwing up the line breaks \n Banana \n Waffles \n Cream" ) ;
}

