------------------
-- Author        : dnyazali
-- Date          : 22 APR 2019
-- Target Devices: terasIC DE10-Lite (10M50DAF484C7G)
-- Design Name   : TIMER_IP_COMP.vhd
------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity TIMER_IP_COMP is
    port(
            CLK_IN              : in std_logic;
            RESET_N_IN          : in std_logic;
            CTRL_TIMER_IN       : in std_logic_vector(1 downto 0);
            DATA_TIMER_INOUT    : inout std_logic_vector(31 downto 0)
            );

end entity TIMER_IP_COMP;

architecture rtl of TIMER_IP_COMP is

begin

    -- MAIN PROCESS --
    process(CLK_IN, RESET_N_IN)
        begin
            if RESET_N_IN = '0' then
                DATA_TIMER_INOUT <= (others => '0');
            elsif rising_edge(CLK_IN) then
                case CTRL_TIMER_IN is
                    when "00"   => DATA_TIMER_INOUT <= DATA_TIMER_INOUT;        -- Timer Stop  ["00"]
                    when "01"   => DATA_TIMER_INOUT <= (others => '0');         -- Timer Reset ["01"]
                    when "10"   => DATA_TIMER_INOUT <= DATA_TIMER_INOUT + 1;    -- Timer Start ["10"]
                    when others => null;                                        -- Nothing
                end case;
            end if;
    end process;
    ------------------

end rtl;