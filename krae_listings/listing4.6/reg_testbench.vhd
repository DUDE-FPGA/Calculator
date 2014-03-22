--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:57:29 03/20/2014
-- Design Name:   
-- Module Name:   /mnt/linux-data/opt/xilinx/projects/listing4.6/reg_testbench.vhd
-- Project Name:  listing4.6
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: reg_file
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
 
ENTITY reg_testbench IS
END reg_testbench;
 
ARCHITECTURE behavior OF reg_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT reg_file
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         wr_en : IN  std_logic;
         w_addr : IN  std_logic_vector(1 downto 0);
         r_addr : IN  std_logic_vector(1 downto 0);
         w_data : IN  std_logic_vector(7 downto 0);
         r_data : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal wr_en : std_logic := '0';
   signal w_addr : std_logic_vector(1 downto 0) := (others => '0');
   signal r_addr : std_logic_vector(1 downto 0) := (others => '0');
   signal w_data : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal r_data : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: reg_file PORT MAP (
          clk => clk,
          reset => reset,
          wr_en => wr_en,
          w_addr => w_addr,
          r_addr => r_addr,
          w_data => w_data,
          r_data => r_data
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
		wr_en <= '1';
		w_addr <= "00000001";
      wait for clk_period*10;
		w_data <= "00001111";
		wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
