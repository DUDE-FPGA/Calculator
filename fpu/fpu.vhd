----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:48:50 03/29/2014 
-- Design Name: 
-- Module Name:    fpu - fpu_arch 
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

entity fpu is
	 generic(
		EBIT: integer := 4; --No. of bits to work with
		MBIT: integer := 8);
    Port ( clk, reset, start : in  STD_LOGIC;
           done_tick, ready : out  STD_LOGIC;
			  sign1, sign2: in std_logic;
			  exp1, exp2: in std_logic_vector(EBIT-1 downto 0);
			  frac1, frac2: in std_logic_vector(MBIT-1 downto 0);
			  sign_out: out std_logic;
			  exp_out: out std_logic_vector(EBIT-1 downto 0);
			  frac_out: out std_logic_vector(MBIT-1 downto 0));
end fpu;

architecture fpu_arch of fpu is
	--Register definitions
	type state_type is (idle, sort, align, maths, normalise1, normalise2, done);
	signal state_reg, state_next: state_type;
	-- b - big, s - small, a - aligned, n - normalised
	signal signb_reg, signb_next: std_logic;
	signal signs_reg, signs_next: std_logic;
	signal expb_reg, expb_next: unsigned(EBIT-1 downto 0);
	signal exps_reg, exps_next: unsigned(EBIT-1 downto 0);
	signal expn_reg, expn_next: unsigned(EBIT-1 downto 0);
	signal fracb_reg, fracb_next: unsigned(MBIT-1 downto 0);
	signal fracs_reg, fracs_next: unsigned(MBIT-1 downto 0);
	signal fraca_reg, fraca_next: unsigned(MBIT-1 downto 0);
	signal fracn_reg, fracn_next: unsigned(MBIT-1 downto 0);
	signal sumn_reg, sumn_next: unsigned(MBIT-1 downto 0);
	signal expdiff_reg, expdiff_next: unsigned(EBIT-1 downto 0);
	signal sum_reg, sum_next: unsigned(MBIT downto 0);
	signal lead0_reg, lead0_next: unsigned(2 downto 0);
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
	process (sign1, sign2, exp1, exp2, frac1, frac2,
				signb_reg, signs_reg, expb_reg, exps_reg,
				expn_reg, fracb_reg, fracs_reg, fraca_reg,
				fracn_reg, sumn_reg, expdiff_reg, sum_reg,
				lead0_reg, start)
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
		-- Stage 1: sort to find larger number
		when sort =>
			if (exp1 & frac1) > (exp2 & frac2) then
				signb_next <= sign1;
				signs_next <= sign2;
				expb_next <= unsigned(exp1);
				exps_next <= unsigned(exp2);
				fracb_next <= unsigned(frac1);
				fracs_next <= unsigned(frac2);
			else
				signb_next <= sign2;
				signs_next <= sign1;
				expb_next <= unsigned(exp2);
				exps_next <= unsigned(exp1);
				fracb_next <= unsigned(frac2);
				fracs_next <= unsigned(frac1);
			end if;
			state_next <= align;
		-- Stage 2: align smaller number	
		when align =>	
			expdiff_next <= expb_reg - exps_reg;
			if expdiff_reg="0000" then fraca_next <= fracs_reg;
			elsif expdiff_reg="0001" then fraca_next<="0" & fracs_reg(7 downto 1);
			elsif expdiff_reg="0010" then fraca_next<="00" & fracs_reg(7 downto 2);
			elsif expdiff_reg="0011" then fraca_next<="000" & fracs_reg(7 downto 3);
			elsif expdiff_reg="0100" then fraca_next<="0000" & fracs_reg(7 downto 4);
			elsif expdiff_reg="0101" then fraca_next<="00000" & fracs_reg(7 downto 5);
			elsif expdiff_reg="0110" then fraca_next<="000000" & fracs_reg(7 downto 6);
			elsif expdiff_reg="0111" then fraca_next<="0000000" & fracs_reg(7);
			else fraca_next <= "00000000";
			end if;
			state_next <= maths;
		-- Stage 3: add/subtract
		when maths =>
			if (signb_reg=signs_reg) then sum_next <= ('0' & fracb_reg) + ('0' & fraca_reg);
			else sum_next <= ('0' & fracb_reg) - ('0' & fraca_reg);
			end if;
			state_next <= normalise1;
		-- Stage 4: normalise
		when normalise1 =>
			-- 4a: count leading 0s
			if (sum_reg(7)='1') then lead0_next <= "000";
			elsif (sum_reg(6)='1') then lead0_next <= "010";
			elsif (sum_reg(5)='1') then lead0_next <= "011";
			elsif (sum_reg(4)='1') then lead0_next <= "100";
			elsif (sum_reg(3)='1') then lead0_next <= "101";
			elsif (sum_reg(2)='1') then lead0_next <= "110";
			else lead0_next <= "111";
			end if;
			-- 4b: shift significand according to leading 0
			if lead0_reg="000" then sumn_next <= sum_reg(7 downto 0);
			elsif lead0_reg="001" then sumn_next <= sum_reg(6 downto 0) & '0';
			elsif lead0_reg="010" then sumn_next <= sum_reg(5 downto 0) & "00";
			elsif lead0_reg="011" then sumn_next <= sum_reg(4 downto 0) & "000";
			elsif lead0_reg="100" then sumn_next <= sum_reg(3 downto 0) & "0000";
			elsif lead0_reg="101" then sumn_next <= sum_reg(2 downto 0) & "00000";
			elsif lead0_reg="110" then sumn_next <= sum_reg(1 downto 0) & "000000";
			else sumn_next <= sum_reg(0) & "0000000"; 
			end if;
			state_next <= normalise2;
		-- 4c: normalise with special conditions
		when normalise2 =>
			if sum_reg(8)='1' then --without carry out: shift frac right
				expn_next <= expb_reg + 1;
				fracn_next <= sum_reg(8 downto 1);
			elsif (lead0_reg > expb_reg) then --No. too small to normalise
				expn_next <= (others=>'0');
				fracn_next <= (others=>'0');
			else
				expn_next <= expb_reg - lead0_reg;
				fracn_next <= sumn_reg;
			end if;
			state_next <= done;
		when done => 
			done_tick <= '1';
			state_next <= idle;
	end case;
	end process;
	-- Outputs
	sign_out <= signb_reg;
	exp_out <= std_logic_vector(expn_reg);
	frac_out <= std_logic_vector(fracn_reg);

end fpu_arch;

