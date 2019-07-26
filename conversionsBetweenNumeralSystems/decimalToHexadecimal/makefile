CC=gcc
ASMBIN=nasm

all : asm cc link
asm :
	$(ASMBIN) -f elf dechex.asm -o dechex.o
cc :
	$(CC) -m32 -c main.cc -o main.o
link :
	$(CC) -m32 -lstdc++ main.o dechex.o -o dechex
clean :
	rm *.o
	rm dechex
