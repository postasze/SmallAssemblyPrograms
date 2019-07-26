CC=gcc
ASMBIN=nasm

all : asm cc link
asm :
	$(ASMBIN) -f elf decbin.asm -o decbin.o
cc :
	$(CC) -m32 -c main.cc -o main.o
link :
	$(CC) -m32 -lstdc++ main.o decbin.o -o decbin
clean :
	rm *.o
	rm decbin
