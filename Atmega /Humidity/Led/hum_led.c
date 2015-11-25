#include <avr/io.h>
#include <stdlib.h>
#include <string.h>
#include <avr/pgmspace.h>
#include <avr/interrupt.h>
#include <avr/wdt.h>
#include <util/delay.h>
#include "avr_compat.h"
#include "hw_dht11.h"
#include "aux_globals.h"

#define LED_PIN PC4

// sensor data
int milis = 0,sec = 0, 
    // sensor data
    dht11_temp=0, dht11_humidity=0;

ISR (TIMER0_OVF_vect)  
{
    //PORTC |= (1 << LED_PIN);
    PORTC &=~(1 << LED_PIN);
    milis ++;
    if (milis >= 976) {
        sec++;
        milis = 0; // 976 x 1.024ms ~= 1000 ms = 1sec
 
        if (1){//sec%1 == 0) { //every 2 seconds
            // read sensors //
            
            // dht-11
            int tmp_humi = 0 , tmp_temp = 0;
            if (DHT11_read(&tmp_temp, &tmp_humi) == 0) {
                dht11_temp = tmp_temp;
                dht11_humidity = tmp_humi;
            }
        }    
        if (sec%60 ==0) {
            sec = 0;
        }
    }

}


/*
 * Main entry point
 */
int main(void) {
    //led
    DDRC |= (1 << LED_PIN);
    PORTC |= (1 << LED_PIN);
    _delay_ms(1000);
    sei(); 
    while (1) {
        if (dht11_temp != 0){
            PORTC |= (1 << LED_PIN);
            _delay_ms(1000);
        }
        else{
            PORTC &=~(1 << LED_PIN);
            _delay_ms(1000);
        }
    }        
    return (0);
} 
