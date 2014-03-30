----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:57:37 03/30/2014 
-- Design Name: 
-- Module Name:    fp32_to_bcd_13bit - Behavioral 
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

entity fp32_to_bcd_32bit is
    Port ( --CONTROL
			  clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           start_conv : in  STD_LOGIC;
			  
			  ready : out  STD_LOGIC;
           done_tick : out  STD_LOGIC;
			  --DATA INPUT
           fp32 : in  STD_LOGIC_VECTOR(31 downto 0); -- 32 bits
			  --DATA OUTPUT
				--Highest storeable fp32 value:-
				-- The range for single is:
				-- -3.40282e+38 to -1.17549e-38 and
				-- 1.17549e-38 to  3.40282e+38
				--Therefore 39 storeable values, plus 1 for sign
				--Need output of 40 BCD values
				--Yay 2D array in VHDL to deal with :S
				--Don't need 2D array, one giant block is okay.
					--type dataout is array (39 downto 0) of std_logic_vector(3 downto 0);
					--bcds : dataout;
			  bcd : out STD_LOGIC_VECTOR(159 downto 0);--40*4=160
           sign : out  STD_LOGIC -- 1 bit, as a check value
			  );
end fp32_to_bcd_32bit;

architecture fp32_2_bcd of fp32_to_bcd_32bit is
	type state_type is (idle, op, done);
	signal state_reg, state_next: state_type;
	signal fp32_reg, fp32_next: std_logic_vector(31 downto 0);
	signal bcd_reg, bcd_next: std_logic_vector(159 downto 0);
	signal sign_reg, sign_next: std_logic;	
begin
	--state and register updates
	process(clk, reset)
	begin
		if reset='1' then --Nullify registers
			state_reg <= idle;
			fp32_reg <= (others=>'0');
			bcd_reg <= (others=>'0');
			sign_reg <= '0';
		elsif (clk'event and clk='1') then --Update registers
			state_reg <= state_next;
			fp32_reg <= fp32_next;
			bcd_reg <= bcd_next;
			sign_reg <= sign_next;
		end if;
	end process;
		
		

end fp32_2_bcd;

