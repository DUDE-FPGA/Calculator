----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:36:38 05/08/2014 
-- Design Name: 
-- Module Name:    fpu32_divide_v2 - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fpu32_divide_v2 is
    Port ( clk, reset : in  STD_LOGIC;
           fp1, fp2 : in  STD_LOGIC_VECTOR (31 downto 0);
			  fp3, fp4 : in  STD_LOGIC_VECTOR (31 downto 0);
           fp_out : out  STD_LOGIC_VECTOR (31 downto 0));
end fpu32_divide_v2;

architecture divide of fpu32_divide_v2 is
	signal reset1, reset2: std_logic;
	signal start: std_logic;
	signal done1, done2: std_logic;
	signal ready1, ready2: std_logic;
	signal fp1_out, fp2_out: std_logic_vector(31 downto 0);

begin
	fpu32_mul_unit1 : entity work.fpu32_multiply 
		port map(clk, reset1, start, done1, ready1, fp1, fp2, fp1_out);
	fpu32_mul_unit2 : entity work.fpu32_multiply
		port map(clk, reset2, start, done2, ready2, fp3, fp4, fp2_out);
	
	process(reset1, reset2, start)
	begin
	if reset = '1' then
		reset1 <= '1';
		reset2 <= '1';
		reset1 <= '0';
		reset2 <= '0';
	end if;
	
	start <= '1';
	
	end process;
end divide;

