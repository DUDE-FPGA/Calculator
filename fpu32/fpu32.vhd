----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:59:06 03/29/2014 
-- Design Name: 
-- Module Name:    fpu32 - fpu32_arch 
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

entity fpu32 is
    Port ( clk, reset, start : in  STD_LOGIC;
           done_tick, ready : out  STD_LOGIC;
			  fp1, fp2 : in std_logic_vector(31 downto 0);
			  fp_out : out std_logic_vector(31 downto 0);
			  debug_val : out std_logic_vector(7 downto 0));
end fpu32;

architecture fpu32_arch of fpu32 is
	--Register definitions
	type state_type is (idle, sort, align, maths, normalise1, 
							  normalise2, normalise3, done);
	signal state_reg, state_next: state_type;
	-- b - big, s - small, a - aligned, n - normalised
	signal signb_reg, signb_next: std_logic;
	signal signs_reg, signs_next: std_logic;
	signal expb_reg, expb_next: unsigned(7 downto 0);
	signal exps_reg, exps_next: unsigned(7 downto 0);
	signal expn_reg, expn_next: unsigned(7 downto 0);
	signal fracb_reg, fracb_next: unsigned(22 downto 0);
	signal fracs_reg, fracs_next: unsigned(22 downto 0);
	signal fraca_reg, fraca_next: unsigned(22 downto 0);
	signal fracn_reg, fracn_next: unsigned(22 downto 0);
	signal sumn_reg, sumn_next: unsigned(22 downto 0);
	signal expdiff_reg, expdiff_next: unsigned(7 downto 0);
	signal sum_reg, sum_next: unsigned(23 downto 0);
	signal lead0_reg, lead0_next: unsigned(7 downto 0);
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
		
		case state_reg is
			when idle =>
				ready <= '1';
				if start = '1' then
					state_next <= sort;
				end if;
			-- Sort into biggest and smallest
			when sort =>
				if fp1(30 downto 0) > fp2(30 downto 0) then
					signb_next <= fp1(31);
					expb_next <= unsigned(fp1(30 downto 23));
					fracb_next <= unsigned(fp1(22 downto 0));
					signs_next <= fp2(31);
					exps_next <= unsigned(fp2(30 downto 23));
					fracs_next <= unsigned(fp2(22 downto 0));
				else
					signb_next <= fp2(31);
					expb_next <= unsigned(fp2(30 downto 23));
					fracb_next <= unsigned(fp2(22 downto 0));
					signs_next <= fp1(31);
					exps_next <= unsigned(fp1(30 downto 23));
					fracs_next <= unsigned(fp1(22 downto 0));
				end if;
				state_next <= align;
			-- Align smaller number with bigger number
			when align =>
				expdiff_next <= expb_reg - exps_reg;
				fraca_next <= fracs_reg srl to_integer(expdiff_reg);
				state_next <= maths;
			-- Add or subtract based on signs of the numbers
			when maths =>
				if (signb_reg = signs_reg) then 
					sum_next <= ('0' & fracb_reg) + ('0' & fraca_reg);
				else sum_next <= ('0' & fracb_reg) - ('0' & fraca_reg);
				end if;
				state_next <= normalise1;
			-- Count the leading 0's
			when normalise1 =>
				for i in 23 downto 0 loop
					if sum_reg(i)='1' then
						lead0_next <= to_unsigned(23 - i,8);
					end if;
					exit when sum_reg(i)='1';
				end loop;
				state_next <= normalise2;
			-- Shift number based on leading 0's
			when normalise2 =>
				sumn_next <= sum_reg sll to_integer(lead0_reg); -- Issue here with logic left shift
				state_next <= normalise3;
			-- Prepare outputs
			when normalise3 =>
				expn_next <= expb_reg - lead0_reg;
				fracn_next <= sumn_reg;
				state_next <= done;
			when done =>
				done_tick <= '1';
				state_next <= idle;
		end case;
	end process;
	--Outputs
	--Debug - check if correctly sorting
	--fp_out <= signb_reg & std_logic_vector(expb_reg) & std_logic_vector(fracb_reg);
	debug_val <= std_logic_vector(lead0_reg);
	fp_out <= signb_reg & std_logic_vector(expn_reg) & std_logic_vector(fracn_reg);
end fpu32_arch;

