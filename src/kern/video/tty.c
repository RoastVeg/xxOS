#include "../../../src/kern/video/tty.h"

void tty_clearVideoMemory ( ) {
    char* vid = ( char * ) ADDR_TTY_VIDEO_MEMORY ;
    unsigned int i ;
    
    for ( i = 0 ; i < 80 * 25 ; i++ ) {
        *( vid + i ) = 0x00 ;
    }
}

void tty_printMemDump ( char *ptr , unsigned int length ) {

}

void tty_printString ( int offset , int col , char *str ) {
    char* vid = ( char* ) ADDR_TTY_VIDEO_MEMORY ;
    
    while ( *str != 0x00 && *vid < 80*25 ) {
        *vid = *str ;
        vid++ ;
        *vid = col ;
        vid++ ;
        str++ ;
    }
}

