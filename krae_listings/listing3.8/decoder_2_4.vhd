----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:10:33 03/18/2014 
-- Design Name: 
-- Module Name:    decoder_2_4 - case_arch 
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

entity decoder_2_4 is
    Port ( a : in  STD_LOGIC_VECTOR (1 downto 0);
           en : in  STD_LOGIC;
           y : out  STD_LOGIC_VECTOR (3 downto 0));
end decoder_2_4;

architecture case_arch of decoder_2_4 is
	signal s: std_logic_vector(2 downto 0);
begin
	s <= en & a;
	process(s) begin
		case s is
			when "000"|"001"|"010"|"011" => y <= "0001";
			when "100" => y <= "0001";
			when "101" => y <= "0010";
			when "110" => y <= "0100";
			when others => y <= "1000";
		end case;
	end process;

end case_arch;

