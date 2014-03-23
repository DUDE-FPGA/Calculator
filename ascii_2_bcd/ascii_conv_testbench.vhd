--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:01:43 03/23/2014
-- Design Name:   
-- Module Name:   C:/Users/Vladimir/Documents/GitHub/Calculator/ascii_2_bcd/ascii_conv_testbench.vhd
-- Project Name:  ascii_2_bcd
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ascii_2_bcd
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
 
ENTITY ascii_conv_testbench IS
END ascii_conv_testbench;
 
ARCHITECTURE behavior OF ascii_conv_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ascii_2_bcd
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         start_conv : IN  std_logic;
         ascii : IN  std_logic_vector(5 downto 0);
         bcd : OUT  std_logic_vector(3 downto 0);
         ready : OUT  std_logic;
			sign : OUT std_logic;
         done_tick : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal start_conv : std_logic := '0';
   signal ascii : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal bcd : std_logic_vector(3 downto 0);
   signal ready : std_logic;
   signal done_tick : std_logic;
	signal sign : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ascii_2_bcd PORT MAP (
          clk => clk,
          reset => reset,
          start_conv => start_conv,
          ascii => ascii,
          bcd => bcd,
          ready => ready,
          done_tick => done_tick,
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
		reset <= '1';
      wait until falling_edge(clk);	
		wait until falling_edge(clk);
		reset <= '0';
      wait until falling_edge(clk);
		wait until falling_edge(clk);
		ascii <= "110001";
		start_conv <= '1';

		wait until falling_edge(clk);
		wait until falling_edge(clk);
		start_conv <= '0';
		wait until falling_edge(clk);
		wait until falling_edge(clk);
		wait until falling_edge(clk);
		wait until falling_edge(clk);
		start_conv <= '1';
		ascii <= "110010";
		wait until falling_edge(clk);
		wait until falling_edge(clk);
		wait until falling_edge(clk);		
		ascii <= "110011";
		wait until falling_edge(clk);
		wait until falling_edge(clk);
		wait until falling_edge(clk);
		ascii <= "110100";
		wait until falling_edge(clk);
		wait until falling_edge(clk);
		wait until falling_edge(clk);
		ascii <= "110101";
		wait until falling_edge(clk);
		wait until falling_edge(clk);
		wait until falling_edge(clk);
		ascii <= "110110";
		wait until falling_edge(clk);
		wait until falling_edge(clk);
		wait until falling_edge(clk);
		ascii <= "110111";
		wait until falling_edge(clk);
		wait until falling_edge(clk);
		wait until falling_edge(clk);
		ascii <= "111000";
		wait until falling_edge(clk);
		wait until falling_edge(clk);
		wait until falling_edge(clk);
		ascii <= "111001";
		wait until falling_edge(clk);
		wait until falling_edge(clk);
		wait until falling_edge(clk);
		ascii <= "101101"; -- sign
		wait until falling_edge(clk);
		wait until falling_edge(clk);
		
		assert false
			report "Completed Simulation."
		severity failure;
   end process;

END;
