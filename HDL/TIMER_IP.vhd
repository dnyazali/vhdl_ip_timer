------------------
-- Author        : dnyazali
-- Date          : 22 APR 2019
-- Target Devices: terasIC DE10-Lite (10M50DAF484C7G)
-- Design Name   : TIMER_IP.vhd
-----------------

library ieee;
use ieee.std_logic_1164.all;

entity TIMER_IP is
    port(
            CLK_IN                  : in std_logic;
            RESET_N_IN              : in std_logic;
            CS_N_IN                 : in std_logic;
            ADDR_IN                 : in std_logic_vector(1 downto 0);
            WRITE_N_IN              : in std_logic;
            READ_N_IN               : in std_logic;
            DATA_IN                 : in std_logic_vector(31 downto 0);
            DATA_OUT                : out std_logic_vector(31 downto 0)
            );

end entity TIMER_IP;

architecture rtl of TIMER_IP is

signal DATA_REG                     : std_logic_vector(31 downto 0); -- 32 BITS DATA REGISTER
signal CTRL_REG                     : std_logic_vector(1 downto 0);  -- 2 BITS CONTROL REGISTER

---------- Component TIMER_IP_COMP --------
component TIMER_IP_COMP
    port(
            CLK_IN                  : in std_logic;
            RESET_N_IN              : in std_logic;
            CTRL_TIMER_IN           : in std_logic_vector(1 downto 0);
            DATA_TIMER_INOUT        : inout std_logic_vector(31 downto 0)
            );
end component;
-------------------------------------------

begin

    ---------- Component map TIMER_IP_COMP --------
    C1_TIMER_IP_COMP : TIMER_IP_COMP
    port map(
                CLK_IN              => CLK_IN,
                RESET_N_IN          => RESET_N_IN,
                CTRL_TIMER_IN       => CTRL_REG,
                DATA_TIMER_INOUT    => DATA_REG
                );
    -----------------------------------------------

    -- TIMER READ PROCESS --
    bus_timer_read_process : process(CS_N_IN, READ_N_IN, ADDR_IN)
        begin
            if((CS_N_IN = '0') and (READ_N_IN = '0') and (ADDR_IN = "00")) then
                DATA_OUT <= DATA_REG;           -- Output 'timer_read'
            else
                DATA_OUT <= (others => 'X');    -- else output 'X'
            end if;
    end process bus_timer_read_process;
    -----------------------

    -- TIMER WRITE PROCESS --
    bus_timer_write_process : process(CLK_IN, RESET_N_IN)
        begin
            if RESET_N_IN = '0' then
                CTRL_REG <= (others => '0');    -- Output '0' if reset
            elsif rising_edge(CLK_IN) then
                if ((CS_N_IN = '0') and (WRITE_N_IN = '0') and (ADDR_IN = "01")) then
                    --CTRL_REG(1 downto 0) <= DATA_IN(31 downto 30);
                    CTRL_REG <= DATA_IN(31 downto 30);
                end if;
            end if;
    end process bus_timer_write_process;
    -------------------------

end rtl;