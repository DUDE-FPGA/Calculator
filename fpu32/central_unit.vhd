----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:56:30 05/13/2014 
-- Design Name: 
-- Module Name:    central_unit - central 
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

entity central_unit is
    Port ( clk, reset, start : in  STD_LOGIC;
           done_tick, ready : out  STD_LOGIC;
			  op_type: in STD_LOGIC_VECTOR(1 downto 0);
           ascii1_in, ascii2_in, ascii3_in : in  STD_LOGIC_VECTOR (6 downto 0); 
			  ascii4_in, ascii5_in, ascii6_in : in  STD_LOGIC_VECTOR (6 downto 0);
           ascii_out : out  STD_LOGIC_VECTOR (6 downto 0));
end central_unit;

architecture central of central_unit is
	type state_type is (idle, ascii_bcd, bcd_fp, fp_bcd, bcd_ascii, done);
	signal state_reg, state_next: state_type;
	
-- ASCII to BCD signals
	signal start_ascii_to_bcd_reg, start_ascii_to_bcd_next: std_logic;
	signal bcd1, bcd2, bcd3, bcd4, bcd5, bcd6: std_logic_vector(3 downto 0);
	signal ascii1_ready, ascii1_done: std_logic;
	signal ascii2_ready, ascii2_done: std_logic;
	signal ascii3_ready, ascii3_done: std_logic;
	signal ascii4_ready, ascii4_done: std_logic;
	signal ascii5_ready, ascii5_done: std_logic;
	signal ascii6_ready, ascii6_done: std_logic;
	
-- BCD to FP32 signals will go here

-- FP32 to BCD signals will go here

-- BCD to ASCII signals
	signal start_bcd_to_ascii_reg, start_bcd_to_ascii_next: std_logic;
	signal bcd_ascii_ready, bcd_ascii_done: std_logic;

-- FPU signals
	signal start_fpu_reg, start_fpu_next: std_logic;
	signal fpu_done, fpu_ready: std_logic_vector;
	
begin
-- Input in form 123456
-- Converters for each ascii character to bcd
	ascii_to_bcd1 : entity work.ascii_2_bcd
		port map(clk, reset, start_ascii_to_bcd_reg, ascii1_in, bcd1, sign, ascii1_ready, ascii1_done);
	ascii_to_bcd2 : entity work.ascii_2_bcd
		port map(clk, reset, start_ascii_to_bcd_reg, ascii2_in, bcd2, sign, ascii2_ready, ascii2_done);
	ascii_to_bcd3 : entity work.ascii_2_bcd
		port map(clk, reset, start_ascii_to_bcd_reg, ascii3_in, bcd3, sign, ascii3_ready, ascii3_done);
	ascii_to_bcd4 : entity work.ascii_2_bcd
		port map(clk, reset, start_ascii_to_bcd_reg, ascii4_in, bcd1, sign, ascii4_ready, ascii4_done);
	ascii_to_bcd5 : entity work.ascii_2_bcd
		port map(clk, reset, start_ascii_to_bcd_reg, ascii5_in, bcd1, sign, ascii5_ready, ascii5_done);
	ascii_to_bcd6 : entity work.ascii_2_bcd
		port map(clk, reset, start_ascii_to_bcd_reg, ascii6_in, bcd6, sign, ascii6_ready, ascii6_done);
		
-- BCD to FP32 instance goes here

-- FP32 to BCD instance goes here
		
-- Output one ascii character at a time, so just 1 instance
	bcd_to_ascii: entity work.bcd_2_ascii
		port map(clk, reset, start_bcd_to_ascii_reg, bcd_conv, ascii_out, sign, bcd_ascii_ready, bcd_ascii_done);
	
-- Floating point maths unit
	fpu32: entity work.fpu32_main
		port map(clk, reset, start_fpu, fpu_done, fpu_ready, op_type, fp1, fp2, fp_out);
		
	--Registers
	process(clk, reset)
	begin
		if reset='1' then
			state_reg<=idle;
			start_ascii_reg<='0';
			start_multi_reg<='0';
			start_divide_reg<='0';
			
		elsif(clk'event and clk='1') then
			state_reg<=state_next;
			start_ascii_reg<=start_ascii_next;
			start_multi_reg<=start_multi_next;
			start_divide_reg<=start_divide_next;
			
		end if;
	end process;
	
	process(state_reg)
		ready<='0';
		case state_reg is
			when idle =>
				ready<='1';
			when ascii_bcd =>
			when bcd_fp =>
			when fp_bcd =>
			when bcd_ascii =>
			when done =>
		end case;
		begin
	
	end process;

end central;

