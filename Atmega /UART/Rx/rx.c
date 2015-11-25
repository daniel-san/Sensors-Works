#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include "uart.h"

#define F_CPU 16000000UL // 16 MHz
#define UART_BAUD_RATE      9600

int main()
{
    unsigned char c;
	DDRC |= 0b100000;//led pin PC5

    uart_init( UART_BAUD_SELECT(UART_BAUD_RATE,F_CPU) );
    sei();

	while(1)
	{
        c = uart_getc();

        if ((c & UART_FRAME_ERROR) || (c & UART_OVERRUN_ERROR) 
            || (c & UART_BUFFER_OVERFLOW) || (c & UART_NO_DATA))
            continue;
        
        if(c == 'h')
            PORTC |= 0b100000; //if received a 'h', turn the led on 
        else if (c == 'l')
            PORTC &= 0b1011111; //if received a 'l', turn the led off

        _delay_ms (3000); //delay of 4 seconds
	}
	return 1;
}
