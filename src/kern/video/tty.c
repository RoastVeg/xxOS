#include "../../../src/kern/video/tty.h"

void tty_printString ( int col , const char *str ) {
    char* vid = ( char* ) ADDR_TTY_VIDEO_MEMORY ;
    
    while ( *str != 0x00 ) {
        *vid = *str ;
        vid++ ;
        *vid = col ;
        vid++ ;
        str++ ;
    }
}

void tty_clearVideoMemory ( ) {
    char* vid = ( char * ) ADDR_TTY_VIDEO_MEMORY ;
    unsigned int i ;
    
    for ( i = 0 ; i < 80 * 25 ; i++ ) {
        *( vid + i ) = 0x00 ;
    }
}

