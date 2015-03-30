#ifndef TTY_VIDEO_H_
#define TTY_VIDEO_H_

#define ADDR_TTY_VIDEO_MEMORY 0xB8000

void tty_clearVideoMemory ( ) ;

void tty_printMemDump     ( char* , unsigned int ) ;
void tty_printString      ( int , int , char * ) ;

#endif

