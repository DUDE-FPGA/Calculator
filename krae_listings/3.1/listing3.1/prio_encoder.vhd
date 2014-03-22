----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:39:02 03/18/2014 
-- Design Name: 
-- Module Name:    prio_encoder - cond_arch 
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
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity prio_encoder is
	port(
		r: in std_logic_vector(4 downto 1);
		pcode: out std_logic_vector(2 downto 0));
end prio_encoder;

architecture cond_arch of prio_encoder is

begin
	pcode <= "100" when (r(4)='1') else
				"011" when (r(3)='1') else
				"010" when (r(2)='1') else
				"001" when (r(1)='1') else
				"000";

end cond_arch;

