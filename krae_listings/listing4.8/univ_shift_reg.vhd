----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:20:04 03/20/2014 
-- Design Name: 
-- Module Name:    univ_shift_reg - arch 
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

entity univ_shift_reg is
	 generic(N: integer := 8);
    Port ( clk, reset : in  STD_LOGIC;
           ctrl : in  STD_LOGIC_VECTOR (1 downto 0);
           d : in  STD_LOGIC_VECTOR (N-1 downto 0);
           q : out  STD_LOGIC_VECTOR (N-1 downto 0));
end univ_shift_reg;

architecture arch of univ_shift_reg is
	signal r_reg: std_logic_vector(N-1 downto 0);
	signal r_next: std_logic_vector(N-1 downto 0);
begin
	--register
	process(clk,reset)
	begin
		if (reset = '1') then
			r_reg <= (others=>'0');
		elsif (clk'event and clk='1') then
			r_reg <= r_next;
		end if;
	end process;
	-- next-state logic
	with ctrl select
		r_next <=
			r_reg								  when "00", --no op
			r_reg(N-2 downto 0) & d(0)   when "01", --shif left;
			d(N-1) & r_reg(N-1 downto 1) when "10", --shift right;
			d									  when others; --load
	--output
	q <= r_reg;


end arch;

