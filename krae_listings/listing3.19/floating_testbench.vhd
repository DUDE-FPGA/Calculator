--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:12:28 03/18/2014
-- Design Name:   
-- Module Name:   /mnt/linux-data/opt/xilinx/projects/listing3.19/floating_testbench.vhd
-- Project Name:  listing3.19
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: fp_adder
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
 
ENTITY floating_testbench IS
END floating_testbench;
 
ARCHITECTURE behavior OF floating_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT fp_adder
    PORT(
         clk : IN  std_logic;
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
   signal sign1 : std_logic := '0';
   signal sign2 : std_logic := '0';
   signal exp1 : std_logic_vector(3 downto 0) := (others => '0');
   signal exp2 : std_logic_vector(3 downto 0) := (others => '0');
   signal frac1 : std_logic_vector(7 downto 0) := (others => '0');
   signal frac2 : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal sign_out : std_logic;
   signal exp_out : std_logic_vector(3 downto 0);
   signal frac_out : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fp_adder PORT MAP (
          clk => clk,
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
      wait for 100 ns;	
		sign1 <= '0'; sign2 <= '0';
		exp1 <= "0010"; exp2 <= "0010";
		frac1 <= "11000000"; frac2 <= "00100000";
      wait for clk_period*10;
		sign1 <= '0'; sign2 <= '0';
		exp1 <= "0010"; exp2 <= "0001";
		frac1 <= "11000000"; frac2 <= "00100000";
      wait for clk_period*10;
		sign1 <= '0'; sign2 <= '0';
		exp1 <= "0000"; exp2 <= "0000";
		frac1 <= "11000000"; frac2 <= "00100000";
      wait for clk_period*10; 

      wait;
   end process;

END;
