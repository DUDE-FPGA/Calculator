----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:06:58 03/17/2014 
-- Design Name: 
-- Module Name:    eq2 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use ieee.std_logic_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity eq2 is
    Port ( a : in  STD_LOGIC_VECTOR (1 downto 0);
           b : in  STD_LOGIC_VECTOR (1 downto 0);
           aeqb : out  std_logic
	 );
end eq2;

architecture struc_arch of eq2 is
	signal e0, e1: std_logic;

begin
	-- instantiate two 1-bit comparators
	eq_bit0_unit: entity work.eq1(sop_arch)
		port map(i0=>a(0), i1=>b(0), eq=>e0);
	eq_bit1_unit: entity work.eq1(sop_arch)
		port map(i0=>a(1), i1=>b(1), eq=>e1);
	-- a and b are equal if individual bits are equal
	aeqb <= e0 and e1;
end struc_arch;

