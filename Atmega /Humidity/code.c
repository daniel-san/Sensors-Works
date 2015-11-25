/* @project
 * 
 * License to access, copy or distribute this file.
 * This file or any portions of it, is Copyright (C) 2012, Radu Motisan ,  http://www.pocketmagic.net . All rights reserved.
 * @author Radu Motisan, radu.motisan@gmail.com
 * 
 * This file is protected by copyright law and international treaties. Unauthorized access, reproduction 
 * or distribution of this file or any portions of it may result in severe civil and criminal penalties.
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * 
 */

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

int milis = 0,sec = 0, 
    // sensor data
    dht11_temp=0, dht11_humidity=0;
 
/*
    timer0 overflow interrupt
    event to be exicuted every  1.024ms here
*/
ISR (TIMER0_OVF_vect)  
{
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
    // 2.CREATE Timer T0 to count seconds
    TIMSK |= (1 << TOIE0);
    // set prescaler to 64 and start the timer
    TCCR0 |= (1 << CS01) | (1 << CS00);
    // start timer and interrupts
    sei();

    //code do send the sensor data
    while (1) {
        fcpu_delay_ms(1000);
        //verify if a new read has been made in the sensor, and send the data throught xbee module

    }        
    return (0);
} 
