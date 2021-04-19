/*
 * File  : timer_regs.h
 * Author: dnyazali
 * Date  : 21 NOV 2017
 * Device: terasIC DE10-Lite (10M50DAF484C7G)
 */

#ifndef TIMER_REGS_H_
#define TIMER_REGS_H_

#include <io.h>
#include <system.h>

#define TIMER_START   IOWR_32DIRECT(TIMER_IP_0_BASE, 4, 0x80000000)
#define TIMER_STOP    IOWR_32DIRECT(TIMER_IP_0_BASE, 4, 0x00000000)
#define TIMER_RESET   IOWR_32DIRECT(TIMER_IP_0_BASE, 4, 0x40000000)
#define TIMER_READ    IORD_32DIRECT(TIMER_IP_0_BASE, 0)

void sleep(int ms){
    alt_u32 sleep = 50000 * ms; // calculate millis
    TIMER_RESET;                // reset before iteration
    TIMER_START;                // start new iteration
    while(TIMER_READ < sleep);  // wait, do nothing
}

#endif /* TIMER_REGS_H_ */
