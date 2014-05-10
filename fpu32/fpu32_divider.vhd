----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:33:13 05/10/2014 
-- Design Name: 
-- Module Name:    fpu32_divider - divide 
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

entity fpu32_divider is
    Port ( clk, reset, start : in  STD_LOGIC;
           done_tick, ready : out  STD_LOGIC;
           fp1, fp2 : in  STD_LOGIC_VECTOR (31 downto 0);
           fp_out : out  STD_LOGIC_VECTOR (31 downto 0));
end fpu32_divider;

architecture divide of fpu32_divider is
	type state_type is (idle, multi1, subtract, multi2, done);
	signal state_reg, state_next: state_type;
	-- Adder signals
	signal start_adder_reg, start_adder_next: std_logic;
	signal adder_ready, adder_done: std_logic;
	signal adder_out: std_logic_vector(31 downto 0);
	
	-- Multiplier signals
	signal start_multi1_reg, start_multi1_next: std_logic;
	signal multi1_ready, multi1_done: std_logic;
	signal multi1_out: std_logic_vector(31 downto 0);
	
	signal start_multi2_reg, start_multi2_next: std_logic;
	signal multi2_ready, multi2_done: std_logic;
	signal multi2_out: std_logic_vector(31 downto 0);	
begin
	--Registers
	process(clk, reset)
	begin
		if reset='1' then
			state_reg<=idle;
			start_adder_reg<='0';
			start_multi1_reg<='0';
			start_multi2_reg<='0';
			
		elsif(clk'event and clk='1') then
			state_reg<=state_next;
			start_adder_reg<=start_adder_next;
			start_multi1_reg<=start_multi1_next;
			start_multi2_reg<=start_multi2_next;
		end if;
	end process;
	-- Floating point unit instantiation
	fpu32_add_or_sub : entity work.fpu32 
		port map(clk, reset, start_adder_reg, adder_done, adder_ready, fp1, fp2, adder_out);
	fpu32_multi1 : entity work.fpu32_multiply
		port map(clk, reset, start_multi1_reg, multi1_done, multi1_ready, fp1, fp2, multi1_out);
	fpu32_multi2 : entity work.fpu32_multiply
		port map(clk, reset, start_multi2_reg, multi2_done, multi2_ready, fp1, fp2, multi2_out);		
		-- FSMD next-state logic
	
	process (fp1, fp2, op_type, start_adder_reg, start_multi_reg, state_reg, 
	adder_ready, adder_done, multi1_ready, multi1_done, mutli2_ready, multi2_done)
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
			
			when mutli1 =>
			when subtract =>
			when multi2 =>
			when done =>
				-- Output based on operation type
				if op_type="00" then 
					fp_out<=adder_out;
				elsif op_type="01" then
					fp_out<=multi_out;
				end if;
				done_tick<='1';
				state_next<=idle;
				
		end case;
	end process;
	

end divide;

