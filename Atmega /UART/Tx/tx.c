#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include "uart.h"

#define F_CPU 16000000UL // 16 MHz
#define UART_BAUD_RATE      9600

int main()
{
    
    uart_init( UART_BAUD_SELECT(UART_BAUD_RATE,F_CPU) );
    sei();

	while(1)
	{
        uart_putc('h');//send a letter to turn the led on
        _delay_ms (3000); //delay of 3000ms
        uart_putc('l');//send a letter to turn the led off
        _delay_ms (3000); //delay of 3000ms
	}
	return 1;
}
