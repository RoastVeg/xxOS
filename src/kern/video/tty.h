#ifndef TTY_VIDEO_H_
#define TTY_VIDEO_H_

#define ADDR_TTY_VIDEO_MEMORY 0xB8000
#define CHAR_NEW_LINE 10
#define CONSOLE_WIDTH 80
#define CONSOLE_HEIGHT 25

void tty_clearVideoMemory ( ) ;
void tty_printString      ( int , char * ) ;

#endif

