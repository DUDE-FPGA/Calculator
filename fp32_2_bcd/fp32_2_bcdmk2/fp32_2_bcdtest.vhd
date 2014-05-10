--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:10:16 05/10/2014
-- Design Name:   
-- Module Name:   C:/Users/James Donnellan/Documents/GitHub/Calculator/fp32_2_bcd/fp32_2_bcdmk2/fp32_2_bcdtest.vhd
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
USE ieee.numeric_std.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;

package bcd_def is
  --OUTPUTS
  subtype digit is std_logic_vector(3 downto 0); -- 4 bits
  type bcddat is array (7 downto 0) of digit; -- Output bcd value
  type bcdind is array (1 downto 0) of digit; -- Output bcd Standard Form
  --WORKING
  subtype unsdigit is unsigned(3 downto 0); -- 4 bits unsigned
  type bcdOP is array (38 downto 0) of unsdigit; -- unsigned bcd for operations
  type int_array is array (0 to 2) of integer; -- integer array 3 wide for loopcounter registers
end;

use work.bcd_def.all;

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
 
ENTITY fp32_2_bcdtest IS
END fp32_2_bcdtest;
 
ARCHITECTURE behavior OF fp32_2_bcdtest IS 
 
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
         bcdindex : OUT  bcdind;
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
   signal bcdindex : bcdind;
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
          bcdindex => bcdindex,
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
      -- hold reset state for 100 ns.
      reset <= '1';
      wait until falling_edge(clk);	
		wait until falling_edge(clk);
		reset <= '0';
      wait until falling_edge(clk);
		wait until falling_edge(clk);
		--fp32 <= "01000011000000110000000000000000"; --131
		--fp32 <= "01000000010000000000000000000000"; --3
		--fp32 <= "01000001110010000000000000000000"; --25
		--fp32 <= "01000000000000000000000000000000"; --2
		start_conv <= '1';
		wait until falling_edge(clk);
		wait until falling_edge(clk);
		wait until falling_edge(clk);
		wait until falling_edge(clk);
		start_conv <= '0';

      wait for clk_period*1000;

      -- insert stimulus here 

      assert false
			report "Completed Simulation."
		severity failure;

      wait;
   end process;

END;
