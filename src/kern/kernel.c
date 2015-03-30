#include "../../src/kern/video/tty.h"

void main ( void ) {
    tty_clearVideoMemory ( ) ;
    tty_printString ( 0x0F , "Hello, Kernel!" ) ;
}

