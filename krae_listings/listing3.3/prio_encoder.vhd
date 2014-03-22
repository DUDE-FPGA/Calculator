----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:34:20 03/18/2014 
-- Design Name: 
-- Module Name:    prio_encoder - sel_arch 
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
end prio_encoder;

architecture sel_arch of prio_encoder is

begin
	with r select
		pcode <= "100" when "1000"|"1001"|"1010"|"1011"|
								  "1100"|"1101"|"1110"|"1111",
					"011" when "0000";--TODO

end sel_arch;

