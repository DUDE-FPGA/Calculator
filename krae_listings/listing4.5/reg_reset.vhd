----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:33:04 03/20/2014 
-- Design Name: 
-- Module Name:    reg_reset - arch 
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

entity reg_reset is
    Port ( clk, reset : in  STD_LOGIC;
           d : in  STD_LOGIC_VECTOR (7 downto 0);
           q : out  STD_LOGIC_VECTOR (7 downto 0));
end reg_reset;

architecture arch of reg_reset is

begin
	process(clk, reset)
	begin
		if (reset='1') then
			q <=(others=>'0');
		elsif (clk'event and clk='1') then
			q <= d;
		end if;
	end process;

end arch;

