----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:44:43 03/20/2014 
-- Design Name: 
-- Module Name:    reg_file - arch 
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

entity reg_file is
	 generic(
		B: integer:=8; -- No. bits
		W: integer:=2	-- No. address bits
	 );
    Port ( clk, reset : in  STD_LOGIC;
           wr_en : in  STD_LOGIC;
           w_addr, r_addr : in  STD_LOGIC_VECTOR (W-1 downto 0);
           w_data : in  STD_LOGIC_VECTOR (B-1 downto 0);
           r_data : out  STD_LOGIC_VECTOR (B-1 downto 0));
end reg_file;

architecture arch of reg_file is
	type reg_file_type is array (2**W-1 downto 0) of
		std_logic_vector (B-1 downto 0);
	signal array_reg: reg_file_type;

begin
	process(clk,reset)
	begin
		if (reset='1') then
			array_reg <= (others=>(others=>'0'));
		elsif (clk'event and clk='1') then
			if wr_en='1' then
				array_reg(to_integer(unsigned(w_addr))) <= w_data;
			end if;
		end if;
	end process;
	-- read port
	r_data <= array_reg(to_integer(unsigned(r_addr)));
end arch;

