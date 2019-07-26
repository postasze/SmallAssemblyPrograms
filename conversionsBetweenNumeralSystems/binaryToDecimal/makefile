CC=gcc
ASMBIN=nasm

all : asm cc link
asm :
	$(ASMBIN) -f elf bindec.asm -o bindec.o
cc :
	$(CC) -m32 -c main.cc -o main.o
link :
	$(CC) -m32 -lstdc++ main.o bindec.o -o bindec
clean :
	rm *.o
	rm bindec
