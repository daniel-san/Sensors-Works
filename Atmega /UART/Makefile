default:
	avr-gcc -mmcu=atmega8 -Wall -os -o code.elf code.c
	avr-objcopy -j .text -j .data -O ihex code.elf code.hex
upload:
	sudo avrdude -F -p atmega8 -c usbtiny -e -U flash:w:code.hex
