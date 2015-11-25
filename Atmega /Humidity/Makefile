CC=avr-gcc
CFLAGS= -mmcu=atmega8
ELF= -g -Os

default: all

all:
	${CC} ${CFLAGS} -c aux_globals.c \
					   hw_dht11.c
	${CC} ${CFLAGS} code.c -o code.o\
						  aux_globals.o \
						  hw_dht11.o
	${CC} -g ${CFLAGS} code.o -o code.elf
clean:
	rm -f *.o
