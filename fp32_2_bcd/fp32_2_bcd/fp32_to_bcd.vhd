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
use IEEE.NUMERIC_STD.ALL;

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
			  DEBUGConvData: out unsigned(183 downto 0);
           sign : out  STD_LOGIC -- 1 bit, as a check value
			  );
end fp32_to_bcd_32bit;

architecture fp32_2_bcd of fp32_to_bcd_32bit is

	type state_type is (idle, fp32tobcd, done);
	signal state_reg, state_next: state_type;
	signal fp32_reg, fp32_next: std_logic_vector(31 downto 0);
	signal bcd_reg, bcd_next: std_logic_vector(159 downto 0);
	signal sign_reg, sign_next: std_logic;
	--Operation Variables
	signal fp32_mantissa: std_logic_vector(23 downto 0); -- 23 bits + invisible bit
	signal fp32_exponent: unsigned(7 downto 0); -- 8 bits
	signal fp32_datastartpoint: integer; -- from RHS
	signal ConvData: unsigned(183 downto 0); -- 184 bits, needs
	
	function createthree(no:integer) return unsigned is
		variable datasize: integer;--<= ((no*4)-3); note, doesn't work
		variable retthree: unsigned(((no*4)-3) downto 0);
	begin
		datasize := ((no*4)-3);
		retthree:=(others=>'0');
		if no=1 then
			retthree:="11";
			return retthree;
		else
		retthree(datasize downto (datasize-2)):="11";
		--retthree((datasize-2) downto 0):='0';
		end if;
--		for i in 2 to no --possible error point, would take ages to check
--			retthree<=retthree & "0000";
--		end loop;
		return retthree;
	end function;

begin
--	--state and register updates
--	--CONTROL process, acts simultaneously with calculation process below
--	process(clk, reset)
--	begin
--		if reset='1' then --Nullify registers
--			state_reg <= idle;
--			fp32_reg <= (others=>'0');
--			bcd_reg <= (others=>'0');
--			ConvData <= (others=>'0');
--			sign_reg <= '0';
--		elsif (clk'event and clk='1') then --Update registers
--			state_reg <= state_next;
--			fp32_reg <= fp32_next;
--			bcd_reg <= bcd_next;
--			sign_reg <= sign_next;
--		end if;
--	end process;
--	--Data operation process 1 - sign set - nvm i'll ask on monday, i've put everything in here
--	--sensitive to all regs being operated on, and input to-be-operated, and start_conv
--	process(state_reg, fp32_reg, bcd_reg, sign_reg, start_conv, fp32)
--		begin
--			--preset everything
--			ready<='0'; --Its doing stuff now.
--			done_tick<='0'; --It's not done yet.
--			state_next <= state_reg;
--			fp32_next <= fp32_reg;
--			bcd_next <= bcd_reg;
--			sign_next <= sign_reg;
--		case state_reg is
--			when idle => --Accept input.
--				ready<='1';
--				if start_conv='1' then
--					fp32_next<=fp32;
--					state_next <= fp32tobcd;
--				end if;
--			when fp32tobcd =>
--				--Is first bit negative or not?
--				--'1' is minus, '0' is +ve
--				--Can go straight to BCD
--				if fp32_reg(31)='1' then
--					sign_next<='1';
--				else
--					sign_next<='0';
--				end if;
--				--Set mantissa to operation variable
--				fp32_mantissa(22 downto 0) <= fp32_reg(22 downto 0);
--				--Add 'invisible bit'
--				fp32_mantissa(23) <= '1';
--				--Set exponent: Doesn't do anything for now
--				
--				--fp32_exponent<=unsigned(fp32_reg(29 downto 23));
--				
--				--Now, time to implement some crazy stuff
--				--Convert exponential
--				 --Check 1st bit: 1 is +ve exponent
--				if fp32_reg(30)='1' then --Number is > 1
--					--location of decimal point is remaining number + 1
--					--fp32_exponent<=fp32_exponent+1;
--					--Decode this somehow. How do I Binary to BCD?
--					--That Algorithm. Should be started from the point at which the decimal point is located...
--					--Or should it? Better from the poitn at which there is data, ie. the last data point OR the decimal point
--					--Therefore determine which comes first. Never mind, may as well convert whole mantissa.
--					
--					--Start BCD conversion.
--					ConvData(23 downto 0)<=unsigned(fp32_mantissa(23 downto 0));
--					DEBUGConvData<=ConvData;
--					-- 32 bit input, therefore 32 shifts
--					for i in 0 to 31 loop
--						ConvData<=ConvData sll 1; -- left shift 1
--						--Check all digit subsets :S + ignore everything from 23 downwards
--						--160 bits, loop to 40, allow inefficiency until it works
--						for j in 40 downto 1 loop
--							if((ConvData((j*4+23) downto (j*4+19))) > 4) then
--								--Add 0011 to any set of 4
--								--IE if its the one before the end 1010 0000 then add 00110000.
--								--And "0000" * loop counter
--								ConvData<=ConvData+createthree(j);
--							end if;
--						end loop;
--					end loop;
--				else --Number is < 1, > 0
--				
--				end if;
--				bcd_next<=std_logic_vector(ConvData(183 downto 24));
--				state_next<=done;
--			when done =>
--				done_tick <= '1';
--				state_next <= idle;
--	end case;
--	end process;
--	bcd <= bcd_reg;
--	sign <= sign_reg;
		

end fp32_2_bcd;

--NULL CODE - Removed, but still might be useful
--This was in the exponential bit
--K, now start from 2^1 (or left-shift 1 in binary)
					--'if' cascade seems like the easiest way to do this
					--Actually, loop might work
					--for i in 1 to 7 loop --23 to 29
					--	for j in 1 to i loop -- left shift a load
					--		--Wait, why? Pointless, number is already there.
					--	end loop;
					--end loop;
					
--Some Casting
--to_integer(fp32_exponent(6 downto 0));

--FP32 to normal
--Below is unnecessary, convert entire mantissa
--					for i in 0 to 22 loop --Scan for a 1 from the RHS
--						if (21-i) < fp32_exponent then
--							fp32_datastartpoint<=(i);
--							exit;
--						else
--							if fp32_mantissa(i)='1' then
--								fp32_datastartpoint<=(i);
--								exit;
--							end if;
--						end if;
--					end loop;
--ConvData((23-fp32_datastartpoint) downto 0)<=fp32_mantissa(23 downto fp32_datastartpoint);