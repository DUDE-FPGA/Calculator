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
	-- Adder signals
	signal start_adder_reg, start_adder_next: std_logic;
	signal adder_ready, adder_done: std_logic;
	signal adder_out: std_logic_vector(31 downto 0);
	-- Multiplier signals
	signal start_multi_reg, start_multi_next: std_logic;
	signal multi_ready, multi_done: std_logic;
	signal multi_out: std_logic_vector(31 downto 0);
	-- Divider signals
	signal start_divide_reg, start_divide_next: std_logic;
	signal divide_ready, divide_done: std_logic;
	signal divide_out: std_logic_vector(31 downto 0);
	
begin
	--Registers
	process(clk, reset)
	begin
		if reset='1' then
			state_reg<=idle;
			start_adder_reg<='0';
			start_multi_reg<='0';
			start_divide_reg<='0';
			
		elsif(clk'event and clk='1') then
			state_reg<=state_next;
			start_adder_reg<=start_adder_next;
			start_multi_reg<=start_multi_next;
			start_divide_reg<=start_divide_next;
			
		end if;
	end process;
	
	-- Floating point unit instantiation
	fpu32_add_or_sub : entity work.fpu32 
		port map(clk, reset, start_adder_reg, adder_done, adder_ready, fp1, fp2, adder_out);
	fpu32_multi : entity work.fpu32_multiply
		port map(clk, reset, start_multi_reg, multi_done, multi_ready, fp1, fp2, multi_out);
	fpu32_divide : entity work.fpu32_divider
		port map(clk, reset, start_divide_reg, divide_done, divide_ready, fp1, fp2, divide_out);
	
	-- FSMD next-state logic
	process (fp1, fp2, op_type, start_adder_reg, start_multi_reg, start_divide_reg, state_reg, 
	adder_ready, adder_done, multi_ready, multi_done, divide_ready, divide_done)
	begin
		ready<='0';
		--done_tick<='0';
		state_next<=state_reg;
		start_adder_next<=start_adder_reg;
		start_multi_next<=start_multi_reg;
		done_tick<='0';
		case state_reg is
			when idle =>
				ready<='1';
				if start='1' then 
					state_next<=op;
				end if;
			
			when op =>
				-- Check for operation type
				-- 00 - Add/Subtract
				-- 01 - Multiply
				-- 10 - Divide
				if op_type="00" and adder_ready='1' then
					start_adder_next<='1';
				elsif op_type="01" and multi_ready='1' then
					start_multi_next<='1';
				elsif op_type="10" and divide_ready='1' then
					start_divide_next<='1';
				else
					start_adder_next<='0';
					start_multi_next<='0';
					start_divide_next<='0';
				end if;
				
				if adder_done='1' or multi_done='1' or divide_done='1' then
					state_next<=done;
				end if;
				
			when done =>
				-- Output based on operation type
				if op_type="00" then 
					fp_out<=adder_out;
				elsif op_type="01" then
					fp_out<=multi_out;
				elsif op_type="10" then
					fp_out<=divide_out;
				end if;
				done_tick<='1';
				state_next<=idle;
				
		end case;
	
	end process;

end control;

