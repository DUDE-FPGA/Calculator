--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:43:33 03/29/2014
-- Design Name:   
-- Module Name:   C:/Users/Vladimir/Documents/GitHub/Calculator/fpu/fpu_testbench.vhd
-- Project Name:  fpu
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: fpu
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
 
ENTITY fpu_testbench IS
END fpu_testbench;
 
ARCHITECTURE behavior OF fpu_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT fpu
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         start : IN  std_logic;
         done_tick : OUT  std_logic;
         ready : OUT  std_logic;
         sign1 : IN  std_logic;
         sign2 : IN  std_logic;
         exp1 : IN  std_logic_vector(3 downto 0);
         exp2 : IN  std_logic_vector(3 downto 0);
         frac1 : IN  std_logic_vector(7 downto 0);
         frac2 : IN  std_logic_vector(7 downto 0);
         sign_out : OUT  std_logic;
         exp_out : OUT  std_logic_vector(3 downto 0);
         frac_out : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal start : std_logic := '0';
   signal sign1 : std_logic := '0';
   signal sign2 : std_logic := '0';
   signal exp1 : std_logic_vector(3 downto 0) := (others => '0');
   signal exp2 : std_logic_vector(3 downto 0) := (others => '0');
   signal frac1 : std_logic_vector(7 downto 0) := (others => '0');
   signal frac2 : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal done_tick : std_logic;
   signal ready : std_logic;
   signal sign_out : std_logic;
   signal exp_out : std_logic_vector(3 downto 0);
   signal frac_out : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fpu PORT MAP (
          clk => clk,
          reset => reset,
          start => start,
          done_tick => done_tick,
          ready => ready,
          sign1 => sign1,
          sign2 => sign2,
          exp1 => exp1,
          exp2 => exp2,
          frac1 => frac1,
          frac2 => frac2,
          sign_out => sign_out,
          exp_out => exp_out,
          frac_out => frac_out
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
      wait for clk_period*2;
		reset <= '0';

      wait for clk_period;
		start <= '1';
		exp1 <= "0010";
		exp2 <= "0001";
		frac1 <= "01000000";
		frac2 <= "01000000";
		wait for clk_period;
		start <= '0';
		wait for clk_period*20;
		start <= '1';
		frac1 <= "01101001";
		frac2 <= "10000000";
		wait for clk_period;
		start <= '0';
      -- insert stimulus here
		wait for clk_period*20;
		start <= '1';
		exp1 <= "0010";
		exp2 <= "0100";
		wait for clk_period;
		start <= '0';
		wait for clk_period*20;
		assert false
		severity failure;
      
   end process;

END;
