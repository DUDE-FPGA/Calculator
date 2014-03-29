----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:36:24 03/29/2014 
-- Design Name: 
-- Module Name:    bcd_2_ascii - arch 
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

entity bcd_2_ascii is
    Port ( clk, reset : in  STD_LOGIC;
			  start_conv: in std_logic;
           bcd : in  STD_LOGIC_VECTOR (3 downto 0);
			  ascii : out  STD_LOGIC_VECTOR (5 downto 0);
			  sign : out STD_LOGIC;
           ready, done_tick : out  STD_LOGIC);
end bcd_2_ascii;

architecture arch of bcd_2_ascii is
	type state_type is (idle, op, done);
	signal state_reg, state_next: state_type;
	signal ascii_reg, ascii_next: std_logic_vector(5 downto 0);
	signal bcd_reg, bcd_next: std_logic_vector(3 downto 0);
	signal sign_reg, sign_next: std_logic;
begin
	--fsmd state and data registers
	process(clk, reset)
	begin
		if reset='1' then
			state_reg <= idle;
			bcd_reg <= (others=>'0');
			ascii_reg <= "000000";
			--ascii_reg <= (others=>'0');
			sign_reg <= '0';
		elsif (clk'event and clk='1') then
			state_reg <= state_next;
			bcd_reg <= bcd_next;
			ascii_reg <= ascii_next;
			sign_reg <= sign_next;
		end if;
	end process;

	-- fsmd next-state logic
	process(state_reg, ascii_reg, bcd_reg, start_conv, bcd)
	begin
		ready <= '0';
		done_tick <= '0';
		state_next <= state_reg;
		ascii_next <= ascii_reg;
		bcd_next <= bcd_reg;
		sign_next <= sign_reg;
	case state_reg is
		when idle =>
			ready <= '1';
			if start_conv='1' then
				bcd_next <= bcd;
				--bcd_next <= (others=>'0');
				sign_next <= '0';
				state_next <= op;
			end if;
		when op =>
			--checks for negative
			if bcd_reg="1111" then --sign handle
				sign_next <= '1';
				ascii_next <= "101101"; --ascii input to return a negative sign handle
				state_next <= done;
			elsif bcd_next="0000" then ascii_reg <= "110000";
			elsif bcd_next="0001" then ascii_reg <= "110001";
			elsif bcd_next="0010" then ascii_reg <= "110010";
			elsif bcd_next="0011" then ascii_reg <= "110011";
			elsif bcd_next="0100" then ascii_reg <= "110100";
			elsif bcd_next="0101" then ascii_reg <= "110101";
			elsif bcd_next="0110" then ascii_reg <= "110110";
			elsif bcd_next="0111" then ascii_reg <= "110111";
			elsif bcd_next="1000" then ascii_reg <= "111000";
			elsif bcd_next="1001" then ascii_reg <= "111001";
			else ascii_next <= "000000"; --invalid input handle seems right?
			end if;
			state_next <= done;
		when done =>
			done_tick <= '1';
			state_next <= idle;
	end case;
	end process;
	-- output
	ascii <= ascii_reg;
	sign <= sign_reg;
end arch;
