# vhdl_ip_timer

### About Timer IP:
TIMER_IP is a stopwatch IP Core for embedded systems written in VHDL.
The IP component has been developed in VHDL and tested on target device using C.

### Features:
- Streamlined
- Small footprint
- Easy to understand and modify

#### SW Drivers:
To access the IP component include timer_regs.h header file and use the following functions:
- TIMER_START;	– Starts the stopwatch.
- TIMER_STOP;   – Stops the stopwatch.
- TIMER_RESET;  – Resets the stopwatch.
- TIMER_READ;   – Output the time since stopwatch was started.

Note: None of the functions has any return value/codes.

### Verification:
The hardware was compiled in Quartus and functional simulation was carried out by using test vector in ModelSim (see img/ for results).
The IP component was validated on system with Terasic DE10-Lite (Altera MAX 10 based FPGA board, 10M50DAF484C7G).

Feel free to contribute or use!