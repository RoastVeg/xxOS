all : xxOS.img clean

xxOS.img : boot.bin kernel.bin
	cat boot.bin kernel.bin > xxOS.img

boot.bin : src/boot/boot.asm
	nasm -f bin -o boot.bin src/boot/boot.asm

kernel.bin : kcall.o kernel.o tty.o
	ld -o kernel.bin -Ttext 0x1000 --oformat binary kcall.o kernel.o tty.o

kcall.o : src/kern/kcall.asm
	nasm -f elf64 -o kcall.o src/kern/kcall.asm

kernel.o : src/kern/kernel.c
	gcc -ffreestanding -c -o kernel.o src/kern/kernel.c

tty.o : src/kern/video/tty.c
	gcc -ffreestanding -c -o tty.o src/kern/video/tty.c

clean :
	rm *.bin *.o

