----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:06:36 03/23/2014 
-- Design Name: 
-- Module Name:    ascii_2_bcd - arch 
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

entity ascii_2_bcd is
    Port ( clk, reset : in  STD_LOGIC;
			  start_conv: in std_logic;
           ascii : in  STD_LOGIC_VECTOR (5 downto 0);
           bcd : out  STD_LOGIC_VECTOR (3 downto 0);
           ready, done_tick : out  STD_LOGIC);
end ascii_2_bcd;

architecture arch of ascii_2_bcd is
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
			ascii_reg <= (others=>'0');
			bcd_reg <= (others=>'0');
			sign_reg <= '0';
		elsif (clk'event and clk='1') then
			state_reg <= state_next;
			ascii_reg <= ascii_next;
			bcd_reg <= bcd_next;
			sign_reg <= sign_next;
		end if;
	end process;
	
	-- fsmd next-state logic
	process(state_reg, ascii_reg, bcd_reg, start_conv, ascii)
	begin
		ready <= '0';
		done_tick <= '0';
		state_next <= state_reg;
		ascii_next <= ascii_reg;
		bcd_next <= bcd_reg;
	case state_reg is
		when idle =>
			ready <= '1';
			if start_conv='1' then
				ascii_next <= ascii;
				bcd_next <= (others=>'0');
				state_next <= op;
			end if;
		when op =>
			--checks for negative
			if ascii_reg="101101" then
				sign_next <= '1';
				state_next <= done;
			elsif ascii_reg="110000" then
				bcd_next <= "0000";
				state_next <= done;
			elsif ascii_reg="110001" then
				bcd_next <= "0001";
				state_next <= done;
			elsif ascii_reg="110010" then
				bcd_next <= "0010";
				state_next <= done;
			elsif ascii_reg="110011" then
				bcd_next <= "0011";
				state_next <= done;
			elsif ascii_reg="110100" then
				bcd_next <= "0100";
				state_next <= done;
			elsif ascii_reg="110101" then
				bcd_next <= "0101";
				state_next <= done;
			elsif ascii_reg="110110" then
				bcd_next <= "0110";
				state_next <= done;
			elsif ascii_reg="110111" then
				bcd_next <= "0111";
				state_next <= done;
			elsif ascii_reg="111000" then
				bcd_next <= "1000";
				state_next <= done;
			elsif ascii_reg="111001" then
				bcd_next <= "1001";
				state_next <= done;
			end if;
		when done =>
			done_tick <= '1';
			state_next <= idle;
	end case;
	end process;
	-- output
	bcd <= bcd_reg;
end arch;

