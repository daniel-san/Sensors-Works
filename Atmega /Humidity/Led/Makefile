FILE=hum_led

default:
	avr-gcc -mmcu=atmega8 -Wall -os -o ${FILE}.elf ${FILE}.c hw_dht11.o aux_globals.o
	avr-objcopy -j .text -j .data -O ihex ${FILE}.elf ${FILE}.hex
upload:
	sudo avrdude -F -p atmega8 -c usbtiny -e -U flash:w:${FILE}.hex
