#include "../../../src/kern/video/tty.h"

void tty_clearVideoMemory ( ) {
    char* vid = ( char * ) ADDR_TTY_VIDEO_MEMORY ;
    unsigned int i ;
    
    for ( i = 0 ; i < CONSOLE_WIDTH * CONSOLE_HEIGHT ; i++ ) {
        *( vid + i ) = 0x00 ;
    }
}

void tty_printString ( int col , char *str ) {
    char* vid = ( char* ) ADDR_TTY_VIDEO_MEMORY ;
    int curcol = 0;
    
    while ( *str != 0x00 && *vid < CONSOLE_WIDTH*CONSOLE_HEIGHT ) {
	if (*str == CHAR_NEW_LINE ) {
		vid += (CONSOLE_WIDTH-curcol+1)*2;
		curcol = 0;
	} else {
	        *vid = *str ;
        	vid++ ;
		*vid = col ;
	        vid++ ;
		curcol++ ;
		curcol %= CONSOLE_WIDTH ;
	}
        str++ ;
    }
}

