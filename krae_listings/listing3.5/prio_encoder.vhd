----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:56:47 03/18/2014 
-- Design Name: 
-- Module Name:    prio_encoder - if_arch 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity prio_encoder is
    Port ( r : in  STD_LOGIC_VECTOR (4 downto 1);
           pcode : out  STD_LOGIC_VECTOR (2 downto 0));
end prio_encoder;

architecture if_arch of prio_encoder is

begin
	process(r)
	begin
	if (r(4)='1') then pcode <= "100";
	elsif (r(3)='1') then pcode <= "011";
	elsif (r(2)='1') then pcode <= "010";
	elsif (r(1)='1') then pcode <= "001";
	else pcode <= "000";
	end if;
	end process;

end if_arch;

