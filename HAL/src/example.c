/*
 * File  : example.c
 * Author: dnyazali
 * Date  : 21 NOV 2017
 * Device: terasIC DE10-Lite (10M50DAF484C7G)
 */

#include <stdio.h>
#include <timer_regs.h>

int main() {

    int sec = 0;
    int min = 0;

    while(1){

        // Print how many minutes and seconds
        printf("[Time]: %d min, %d sec\n", min, sec);

        TIMER_RESET;                  // Reset the timer
        TIMER_START;                  // Start the timer
        while(TIMER_READ < 50000000); // Wait for one second

        if(sec < 60){
            sec++;                    // Increment by a second
        }
        else {
            sec = 0;                  // Reset sec when 60
            min++;                    // Increment by a minute
        }
    }

  return 0;
}