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

begin
-- Input in form 123456
-- Converters for each ascii character to bcd
	ascii_to_bcd1 : entity work.ascii_2_bcd
		port map(clk, reset, start_ascii_to_bcd, ascii1_in, bcd1, sign, ascii1_ready, ascii1_done);
	ascii_to_bcd2 : entity work.ascii_2_bcd
		port map(clk, reset, start_ascii_to_bcd, ascii2_in, bcd2, sign, ascii2_ready, ascii2_done);
	ascii_to_bcd3 : entity work.ascii_2_bcd
		port map(clk, reset, start_ascii_to_bcd, ascii3_in, bcd3, sign, ascii3_ready, ascii3_done);
	ascii_to_bcd4 : entity work.ascii_2_bcd
		port map(clk, reset, start_ascii_to_bcd, ascii4_in, bcd1, sign, ascii4_ready, ascii4_done);
	ascii_to_bcd5 : entity work.ascii_2_bcd
		port map(clk, reset, start_ascii_to_bcd, ascii5_in, bcd1, sign, ascii5_ready, ascii5_done);
	ascii_to_bcd6 : entity work.ascii_2_bcd
		port map(clk, reset, start_ascii_to_bcd, ascii6_in, bcd6, sign, ascii6_ready, ascii6_done);
		
-- BCD to FP32 goes here

-- FP32 to BCD goes here
		
-- Output one ascii character at a time, so just 1 instance
	bcd_to_ascii: entity work.bcd_2_ascii
		port map(clk, reset, start_bcd_to_ascii, bcd_conv, ascii_out, sign, bcd_ascii_ready, bcd_ascii_done);
	


end central;

