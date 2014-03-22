--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:24:16 03/18/2014
-- Design Name:   
-- Module Name:   /mnt/linux-data/opt/xilinx/projects/listing3.17/barrel_testbench.vhd
-- Project Name:  listing3.17
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: barrel_shifter
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
 
ENTITY barrel_testbench IS
END barrel_testbench;
 
ARCHITECTURE behavior OF barrel_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT barrel_shifter
    PORT(
         clk : IN  std_logic;
         a : IN  std_logic_vector(7 downto 0);
         amt : IN  std_logic_vector(2 downto 0);
         y : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal a : std_logic_vector(7 downto 0) := (others => '0');
   signal amt : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal y : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: barrel_shifter PORT MAP (
          clk => clk,
          a => a,
          amt => amt,
          y => y
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
      wait for 100 ns;	
		
		a <= "00000011";
		amt <= "001";
		
      wait for clk_period*10;
		a <= "00000011";
		amt <= "000";
      wait for clk_period*10;
		a <= "00000111";
		amt <= "100";
      wait for clk_period*10;
		
      -- insert stimulus here 

      wait;
   end process;

END;
