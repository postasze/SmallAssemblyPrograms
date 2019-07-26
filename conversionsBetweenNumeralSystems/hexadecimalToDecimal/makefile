CC=gcc
ASMBIN=nasm

all : asm cc link
asm :
	$(ASMBIN) -f elf hexdec.asm -o hexdec.o
cc :
	$(CC) -m32 -c main.cc -o main.o
link :
	$(CC) -m32 -lstdc++ main.o hexdec.o -o hexdec
clean :
	rm *.o
	rm hexdec
