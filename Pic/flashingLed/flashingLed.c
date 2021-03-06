/**
 * This file is part of the BRAINIAC project from LabEPI.
 */

// Avoid polluting the global namespace with aliases for each pin
#define NO_BIT_DEFINES

// Include SDCC-specific device header
#include "pic16f628a.h"

// Define some useful types - might #include "inttypes.h" instead
typedef unsigned char uint8_t;
typedef unsigned short uint16_t;

/*
 * Define config word ("fuses"); see device header file for symbolic constants
 * or use integer literal (0x3fff, 0b11_1111_1111_1111 without underscores).
 */
__code uint16_t __at(_CONFIG) __configword =
    _FOSC_INTOSCCLK &
    _WDT_OFF &
    _PWRTE_ON &
    _CP_OFF &
    _BODEN_ON &
    _LVP_OFF &
    _CPD_OFF;

#define TRUE            1
#define FALSE           0
#define TIME		100 // In miliseconds

// Adjust to your clock frequency (in Hz)
#define CLOCKFREQ       (4U*1000000U)
// Instructions per millisecond
#define INSNS_PER_MS    (CLOCKFREQ / 4000U)
// Delay loop is about 10 cycles per iteration
#define LOOPS_PER_MS    (INSNS_PER_MS / 10U)

void
delay_ms(uint16_t ms)
{
    uint16_t u;

    while (ms--)
    {
        // Inner loop takes about 10 cycles per iteration + 4 cycles setup
        for (u = 0; u < LOOPS_PER_MS; u++)
        {
            // Prevent this loop from being optimized away
            __asm nop __endasm;
        }
    }
}

void
flash_led(void)
{
    PORTBbits.RB1 = 1;
    delay_ms(TIME);
    PORTBbits.RB1 = 0;
    PORTBbits.RB2 = 1;
    delay_ms(TIME);
    PORTBbits.RB2 = 0;
    PORTBbits.RB4 = 1;
    delay_ms(TIME);
    PORTBbits.RB4 = 0;
}

void
main(void)
{
    /*
     * Setup the registers.
     */
    TRISB = 0;   // set RB0 as output

    while (1)
    {
        flash_led();
    }
}
