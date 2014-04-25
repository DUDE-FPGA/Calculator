----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:33:41 04/25/2014 
-- Design Name: 
-- Module Name:    fpu32_multiply - multiply 
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

entity fpu32_multiply is
    Port ( clk, reset, start : in  STD_LOGIC;
           done_tick, ready : out  STD_LOGIC;
           fp1, fp2 : in  STD_LOGIC_VECTOR (31 downto 0);
           fp_out : out  STD_LOGIC_VECTOR (31 downto 0));
end fpu32_multiply;

architecture multiply of fpu32_multiply is
	--Register definitions
	type state_type is (idle, sort, align, maths, normalise, 
							  output, done);
	signal state_reg, state_next: state_type;
	-- b - big, s - small, a - aligned, n - normalised
	signal signb_reg, signb_next: std_logic;
	signal signs_reg, signs_next: std_logic;
	signal expb_reg, expb_next: unsigned(7 downto 0);
	signal exps_reg, exps_next: unsigned(7 downto 0);
	signal expn_reg, expn_next: unsigned(7 downto 0);
	signal fracb_reg, fracb_next: unsigned(23 downto 0);
	signal fracs_reg, fracs_next: unsigned(23 downto 0);
	signal fraca_reg, fraca_next: unsigned(23 downto 0);
	signal fracn_reg, fracn_next: unsigned(22 downto 0);
	signal sumn_reg, sumn_next: unsigned(23 downto 0);
	signal expdiff_reg, expdiff_next: unsigned(7 downto 0);
	signal sum_reg, sum_next: unsigned(24 downto 0);
	signal lead0_reg, lead0_next: unsigned(5 downto 0);
begin
	--Registers
	process(clk, reset)
	begin
		if reset='1' then
			state_reg<=idle;
			signb_reg<='0';
			signs_reg<='0';
			expb_reg<=(others=>'0');
			exps_reg<=(others=>'0');
			expn_reg<=(others=>'0');
			fracb_reg<=(others=>'0');
			fracs_reg<=(others=>'0');
			fraca_reg<=(others=>'0');
			fracn_reg<=(others=>'0');
			sumn_reg<=(others=>'0');
			expdiff_reg<=(others=>'0');
			sum_reg<=(others=>'0');
			lead0_reg<=(others=>'0');
			
		elsif(clk'event and clk='1') then
			state_reg<=state_next;
			signb_reg<=signb_next;
			signs_reg<=signs_next;
			expb_reg<=expb_next;
			exps_reg<=exps_next;
			expn_reg<=expn_next;
			fracb_reg<=fracb_next;
			fracs_reg<=fracs_next;
			fraca_reg<=fraca_next;
			fracn_reg<=fracn_next;
			sumn_reg<=sumn_next;
			expdiff_reg<=expdiff_next;
			sum_reg<=sum_next;
			lead0_reg<=lead0_next;
		end if;
	end process;
	-- FSMD next-state logic
	process (fp1, fp2,
				signb_reg, signs_reg, expb_reg, exps_reg,
				expn_reg, fracb_reg, fracs_reg, fraca_reg,
				fracn_reg, sumn_reg, expdiff_reg, sum_reg,
				lead0_reg, start, state_reg)
	begin
		ready <= '0';
		done_tick <= '0';
		state_next <= state_reg;
		signb_next <= signb_reg;
		signs_next <= signs_reg;
		expb_next <= expb_reg;
		exps_next <= exps_reg;
		expn_next <= expn_reg;
		fracb_next <= fracb_reg;
		fracs_next <= fracs_reg;
		fraca_next <= fraca_reg;
		fracn_next <= fracn_reg;
		sumn_next <= sumn_reg;
		expdiff_next <= expdiff_reg;
		sum_next <= sum_reg;
		lead0_next <= lead0_reg;
	
	end process;

end multiply;

