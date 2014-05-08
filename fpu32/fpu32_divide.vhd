----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:39:14 05/07/2014 
-- Design Name: 
-- Module Name:    fpu32_divide - division 
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

entity fpu32_divide is
    Port ( clk, reset, start : in  STD_LOGIC;
           done_tick, ready : out  STD_LOGIC;
           fp1, fp2 : in  STD_LOGIC_VECTOR (31 downto 0);
           fp_out : out  STD_LOGIC_VECTOR (31 downto 0));
end fpu32_divide;

architecture divide of fpu32_divide is
	--Register definitions
	type state_type is (idle, assign, align, newton_raphson, normalise1, normalise2, 
							  output, done);
	signal state_reg, state_next: state_type;
	-- b - big, s - small, a - aligned, n - normalised
	signal sign_numerator_reg, sign_numerator_next: std_logic;
	signal sign_denominator_reg, sign_denominator_next: std_logic;
	signal signn_reg, signn_next: std_logic;
	signal exp_numerator_reg, exp_numerator_next: unsigned(7 downto 0);
	signal exp_denominator_reg, exp_denominator_next: unsigned(7 downto 0);
	signal expn_reg, expn_next: unsigned(7 downto 0);
	signal frac_numerator_reg, frac_numerator_next: unsigned(23 downto 0);
	signal frac_denominator_reg, frac_denominator_next: unsigned(23 downto 0);
	signal fraca_reg, fraca_next: unsigned(47 downto 0);
	signal fracn_reg, fracn_next: unsigned(22 downto 0);
	signal expdiff_reg, expdiff_next: unsigned(7 downto 0);
	signal lsb_reg, lsb_next: integer;
	signal msba_reg, msba_next: integer;
	signal xi_reg, xi_next: std_logic_vector(31 downto 0);
	signal d_reg, d_next: std_logic_vector(31 downto 0);

begin
	--Registers
	process(clk, reset)
	begin
		if reset='1' then
			state_reg<=idle;
			sign_numerator_reg<='0';
			sign_denominator_reg<='0';
			signn_reg<='0';
			exp_numerator_reg<=(others=>'0');
			exp_denominator_reg<=(others=>'0');
			expn_reg<=(others=>'0');
			frac_numerator_reg<=(others=>'0');
			frac_denominator_reg<=(others=>'0');
			fraca_reg<=(others=>'0');
			fracn_reg<=(others=>'0');
			expdiff_reg<=(others=>'0');
			lsb_reg<=0;
			msba_reg<=0;
			xi_reg<="00111111100000000000000000000000";
			d_reg<=(others=>'0');
			
		elsif(clk'event and clk='1') then
			state_reg<=state_next;
			sign_numerator_reg<=sign_numerator_next;
			sign_denominator_reg<=sign_denominator_next;
			signn_reg<=signn_next;
			exp_numerator_reg<=exp_numerator_next;
			exp_denominator_reg<=exp_denominator_next;
			expn_reg<=expn_next;
			frac_numerator_reg<=frac_numerator_next;
			frac_denominator_reg<=frac_denominator_next;
			fraca_reg<=fraca_next;
			fracn_reg<=fracn_next;
			expdiff_reg<=expdiff_next;
			lsb_reg<=lsb_next;
			msba_reg<=msba_next;
			xi_reg<=xi_next;
			d_reg<=d_next;
		end if;
	end process;
	-- FSMD next-state logic
	process (fp1, fp2,
				sign_numerator_reg, sign_denominator_reg, exp_numerator_reg, exp_denominator_reg,
				expn_reg, frac_numerator_reg, frac_denominator_reg, fraca_reg,
				fracn_reg, expdiff_reg, xi_reg, d_reg,
				lsb_reg, start, state_reg, signn_reg, msba_reg)
	begin
		ready <= '0';
		done_tick <= '0';
		state_next <= state_reg;
		sign_numerator_next <= sign_numerator_reg;
		sign_denominator_next <= sign_denominator_reg;
		signn_next <= signn_reg;
		exp_numerator_next <= exp_numerator_reg;
		exp_denominator_next <= exp_denominator_reg;
		expn_next <= expn_reg;
		frac_numerator_next <= frac_numerator_reg;
		frac_denominator_next <= frac_denominator_reg;
		fraca_next <= fraca_reg;
		fracn_next <= fracn_reg;
		expdiff_next <= expdiff_reg;
		lsb_next <= lsb_reg;
		xi_next <= xi_reg;
		d_next <= d_reg;
		
		case state_reg is 
			when idle =>
				ready <= '1';
				if start = '1' then
					state_next <= assign;
				end if;
			when assign =>
				sign_numerator_next <= fp1(31);
				exp_numerator_next <= unsigned(fp1(30 downto 23));
				frac_numerator_next <= '1' & unsigned(fp1(22 downto 0));
				sign_denominator_next <= fp2(31);
				exp_denominator_next <= unsigned(fp2(30 downto 23));
				frac_denominator_next <= '1' & unsigned(fp2(22 downto 0));
				state_next <= align;
				
			-- Shift mantissas right by one, and subtract exponenets
			when align =>
				expn_next <= (exp_numerator_reg - "01111111") 
					- (exp_denominator_reg - "01111111") + "01111111";
				signn_next <= sign_numerator_reg xor sign_denominator_reg;
				frac_numerator_next <= frac_numerator_reg srl 1;
				frac_denominator_next <= frac_denominator_reg srl 1;
				state_next <= newton_raphson;
				
			-- Perform Newton Raphson on denominator
			when newton_raphson =>
			-- x[i+1] = x[i](2 - d*x[i])
			-- xi_next <= xi_reg * (2 - d_reg * xi_reg);
			-- First do d_reg * xi_reg
			-- fpu32_mul: entity work.

			when normalise1 =>

				state_next <= normalise2;
			when normalise2 =>

				state_next <= output;
			when output =>

				state_next <= done;
			when done =>
				done_tick <= '1';
				state_next <= idle;
		end case;
	end process;

end divide;

