#
# TIMER_HW_IP_SW.tcl
# Wed Apr 24 20:18:14 CEST 2019
#

#
# TIMER_IP "CLK TIMER" v1.0
# dnyazali 2019.04.24.20:18:13
# Simple CLK timer
#

create_driver timer_driver
set_sw_property hw_class_name TIMER_IP
set_sw_property version 1.0
set_sw_property min_compatible_hw_version 1.0
set_sw_property bsp_subdirectory drivers
add_sw_property include_source HAL/inc/timer_regs.h
add_sw_property supported_bsp_type HAL

# END OF FILE