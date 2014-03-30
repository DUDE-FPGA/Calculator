--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:36:27 03/29/2014
-- Design Name:   
-- Module Name:   C:/Users/James Donnellan/Documents/GitHub/Calculator/bcdtoascii/bcd_to_ascii/bcd-asciiTestBench.vhd
-- Project Name:  bcd_to_ascii
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: bcd_2_ascii
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
--USE ieee.numeric_std.ALL;
 
ENTITY bcdasciiTestBench IS
END bcdasciiTestBench;
 
ARCHITECTURE behavior OF bcdasciiTestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT bcd_2_ascii
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         start_conv : IN  std_logic;
         bcd : IN  std_logic_vector(3 downto 0);
         ascii : OUT  std_logic_vector(5 downto 0);
         sign : OUT  std_logic;
         ready : OUT  std_logic;
         done_tick : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal start_conv : std_logic := '0';
   signal bcd : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal ascii : std_logic_vector(5 downto 0);
   signal ready : std_logic;
   signal done_tick : std_logic;
	signal sign : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: bcd_2_ascii PORT MAP (
          clk => clk,
          reset => reset,
          start_conv => start_conv,
          bcd => bcd,
          ascii => ascii,
          sign => sign,
          ready => ready,
          done_tick => done_tick
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
      reset <= '1';
      wait until falling_edge(clk);	
		wait until falling_edge(clk);
		reset <= '0';
      wait until falling_edge(clk);
		wait until falling_edge(clk);
		bcd <= "0001";
		start_conv <= '1';

		wait until falling_edge(clk);
		wait until falling_edge(clk);
		start_conv <= '0';
		wait until falling_edge(clk);
		wait until falling_edge(clk);
		
		wait until falling_edge(clk);
		wait until falling_edge(clk);
		start_conv <= '1';
		bcd <= "0010";
		wait until falling_edge(clk);
		start_conv <= '0';
		wait until falling_edge(clk);
		wait until falling_edge(clk);
		bcd <= "0011";
		start_conv <= '1';
		wait until falling_edge(clk);
		start_conv <= '1';
		wait until falling_edge(clk);
		wait until falling_edge(clk);
		bcd <= "0011";
		wait until falling_edge(clk);
		wait until falling_edge(clk);
		wait until falling_edge(clk);
		bcd <= "0101";
		wait until falling_edge(clk);
		wait until falling_edge(clk);
		wait until falling_edge(clk);
		bcd <= "0110";
		wait until falling_edge(clk);
		wait until falling_edge(clk);
		wait until falling_edge(clk);
		bcd <= "0111";
		wait until falling_edge(clk);
		wait until falling_edge(clk);
		wait until falling_edge(clk);
		bcd <= "1000";
		wait until falling_edge(clk);
		wait until falling_edge(clk);
		wait until falling_edge(clk);
		bcd <= "1001";
		wait until falling_edge(clk);
		wait until falling_edge(clk);
		wait until falling_edge(clk);
		bcd <= "1111"; -- sign
		wait until falling_edge(clk);
		wait until falling_edge(clk);
		wait until falling_edge(clk);
		bcd <= "1110"; -- invalid
		wait until falling_edge(clk);
		wait until falling_edge(clk);
		wait until falling_edge(clk);
		wait until falling_edge(clk);
		wait until falling_edge(clk);

      assert false
			report "Completed Simulation."
		severity failure;
   end process;

END;
