--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:08:45 03/29/2014
-- Design Name:   
-- Module Name:   C:/Users/Vladimir/Documents/GitHub/Calculator/fpu32/sort_testbench.vhd
-- Project Name:  fpu32
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: fpu32
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
 
ENTITY sort_testbench IS
END sort_testbench;
 
ARCHITECTURE behavior OF sort_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT fpu32
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         start : IN  std_logic;
         done_tick : OUT  std_logic;
         ready : OUT  std_logic;
         fp1 : IN  std_logic_vector(31 downto 0);
         fp2 : IN  std_logic_vector(31 downto 0);
         fp_out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal start : std_logic := '0';
   signal fp1 : std_logic_vector(31 downto 0) := (others => '0');
   signal fp2 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal done_tick : std_logic;
   signal ready : std_logic;
   signal fp_out : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fpu32 PORT MAP (
          clk => clk,
          reset => reset,
          start => start,
          done_tick => done_tick,
          ready => ready,
          fp1 => fp1,
          fp2 => fp2,
          fp_out => fp_out
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
		wait for clk_period;
		reset <= '0';
		wait for clk_period;
		wait until falling_edge(clk);
		wait until falling_edge(clk);
		start <= '1';
		fp1 <= "01000000000000000000000000000000"; --2
		fp2 <= "10111111010000000000000000000000"; -- -0.75
		
		wait for clk_period;
		start <= '0';
		wait for clk_period*10;
		wait until falling_edge(clk);
		wait until falling_edge(clk);
		start <= '1';
		fp1 <= "01000000101000000000000000000000"; --5
		fp2 <= "01000000101000000000000000000000"; --5
		wait for clk_period;
		start <= '0';
		wait for clk_period*10;

		start <= '1';
		fp1 <= "01000001101000000000000000000000"; --20
		fp2 <= "01000010110010000000000000000000"; --100
		wait for clk_period;
		start <= '0';
		wait for clk_period*10;
		start <= '1';
		fp1 <= "01000000000000000000000000000000"; --2
		fp2 <= "00111110100000000000000000000000"; --0.25
		wait for clk_period;
		start <= '0';
		wait for clk_period*10;
		
		assert false
		severity failure;
   end process;

END;