----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:05:16 03/20/2014 
-- Design Name: 
-- Module Name:    free_run_shift_reg - arch 
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

entity free_run_shift_reg is
	 generic(N: integer := 8);
    Port ( clk, reset : in  STD_LOGIC;
           s_in : in  STD_LOGIC;
           s_out : out  STD_LOGIC;
			  regstr : out STD_LOGIC_VECTOR(N-1 downto 0));
end free_run_shift_reg;

architecture arch of free_run_shift_reg is
	signal r_reg: std_logic_vector(N-1 downto 0);
	signal r_next: std_logic_vector(N-1 downto 0);
begin
	-- register
	process(clk, reset)
	begin
		if (reset='1') then
			r_reg <= (others=>'0');
		elsif (clk'event and clk='1') then
			r_reg <= r_next;
		end if;
	end process;
	-- next-state logic, shift right 1 bit
	r_next <= s_in & r_reg(N-1 downto 1);
	-- output
	s_out <= r_reg(0);
	regstr <= r_reg(N-1 downto 0);


end arch;
