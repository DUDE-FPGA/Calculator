--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:52:44 04/29/2014
-- Design Name:   
-- Module Name:   C:/Users/James Donnellan/Documents/GitHub/Calculator/fp32_2_bcd/fp32_2_bcdmk2/yourmum_testbench.vhd
-- Project Name:  fp32_2_bcdmk2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: fp32bcd2
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;

--package bcd_def is
--  subtype digit is std_logic_vector(3 downto 0); -- 4 bits
--  type bcddat is array (7 downto 0) of digit; -- bcd value
--  subtype unsdigit is unsigned(3 downto 0); -- 4 bits unsigned
--  type bcdOP is array (7 downto 0) of unsdigit; -- unsigned bcd for operations
--end;
--
--use work.bcd_def.all;
--
--LIBRARY ieee;
--USE ieee.std_logic_1164.all;
--USE ieee.numeric_std.all;
use work.bcd_def.all;
ENTITY yourmum_testbench IS
END yourmum_testbench;
 
ARCHITECTURE behavior OF yourmum_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT fp32bcd2
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         start_conv : IN  std_logic;
         ready : OUT  std_logic;
         done_tick : OUT  std_logic;
         fp32 : IN  std_logic_vector(31 downto 0);
         bcds : OUT  bcddat;
         sign : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal start_conv : std_logic := '0';
   signal fp32 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal ready : std_logic;
   signal done_tick : std_logic;
   signal bcds : bcddat;
   signal sign : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fp32bcd2 PORT MAP (
          clk => clk,
          reset => reset,
          start_conv => start_conv,
          ready => ready,
          done_tick => done_tick,
          fp32 => fp32,
          bcds => bcds,
          sign => sign
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		reset<='1';
      wait for 20 ns;	
		reset<='0';
		fp32<="01000000101000000000000000000000";
		wait for clk_period;
		start_conv<='1';
		wait for clk_period*2;
		start_conv<='0';
      wait for clk_period*100;

      -- insert stimulus here 

      wait;
   end process;

END;
