--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:02:39 03/18/2014
-- Design Name:   
-- Module Name:   /mnt/linux-data/opt/xilinx/projects/listing3.5/prio_testbench.vhd
-- Project Name:  listing3.5
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: prio_encoder
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
 
ENTITY prio_testbench IS
END prio_testbench;
 
ARCHITECTURE behavior OF prio_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT prio_encoder
    PORT(
         r : IN  std_logic_vector(4 downto 1);
         pcode : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal r : std_logic_vector(4 downto 1) := (others => '0');

 	--Outputs
   signal pcode : std_logic_vector(2 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: prio_encoder PORT MAP (
          r => r,
          pcode => pcode
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		r <= "0000";
		wait for 100 ns;
		r <= "0001";
		wait for 100 ns;
		r <= "1000";
		wait for 100 ns;
		assert false
			report "Simulation Completed"
			severity failure;

   end process;

END;
