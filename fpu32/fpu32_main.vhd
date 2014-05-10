----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:54:06 05/10/2014 
-- Design Name: 
-- Module Name:    fpu32_main - control 
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

entity fpu32_main is
    Port ( clk, reset, start : in  STD_LOGIC;
           done_tick, ready : out  STD_LOGIC;
			  op_type: in STD_LOGIC_VECTOR(1 downto 0);
           fp1, fp2 : in  STD_LOGIC_VECTOR (31 downto 0);
           fp_out : out  STD_LOGIC_VECTOR (31 downto 0));
end fpu32_main;

architecture control of fpu32_main is
	type state_type is (idle, op, done);
	signal state_reg, state_next: state_type;
	signal start_adder_reg, start_adder_next: std_logic;
	signal start_adder_reg2: std_logic;
	signal adder_ready, adder_done, adder_clk: std_logic;
begin
	--Registers
	process(clk, reset)
	begin
		if reset='1' then
			state_reg<=idle;
			start_adder_reg<='0';
			
		elsif(clk'event and clk='1') then
			state_reg<=state_next;
			start_adder_reg<=start_adder_next;
			
		end if;
	end process;
	
	-- Floating point unit instantiation
	fpu32_add_or_sub : entity work.fpu32 
		port map(clk, reset, start_adder_reg2, adder_done, adder_ready, fp1, fp2, fp_out);
	
	-- FSMD next-state logic
	process (fp1, fp2, op_type, start_adder_reg, state_reg)
	begin
		ready<='0';
		--done_tick<='0';
		state_next<=state_reg;
		start_adder_next<=start_adder_reg;
		done_tick<='0';
		case state_reg is
			when idle =>
				ready<='1';
				if start='1' then 
					state_next<=op;
				end if;
				start_adder_reg2<='1';
			
			when op =>
				start_adder_reg<='1';
				
				if adder_done='1' then
					state_next<=state_reg;
				end if;
				
			when done =>
				state_next<=idle;
				
		end case;
	
	end process;

end control;

