--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:08:33 03/20/2014
-- Design Name:   
-- Module Name:   /mnt/linux-data/opt/xilinx/projects/listing4.7/shift_testbench.vhd
-- Project Name:  listing4.7
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: free_run_shift_reg
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
 
ENTITY shift_testbench IS
END shift_testbench;
 
ARCHITECTURE behavior OF shift_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT free_run_shift_reg
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         s_in : IN  std_logic;
         s_out : OUT  std_logic;
			regstr : OUT std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal s_in : std_logic := '0';
   signal s_out : std_logic := '0';
	
	--Outputs
	signal regstr : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: free_run_shift_reg PORT MAP (
          clk => clk,
          reset => reset,
          s_in => s_in,
          s_out => s_out,
			 regstr => regstr
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
		s_in <= '1';
		wait for clk_period;
		s_in <= '0';
      wait for clk_period*10;
		s_in <= '1';
		wait for clk_period*10;
      -- insert stimulus here 

      wait;
   end process;

END;
