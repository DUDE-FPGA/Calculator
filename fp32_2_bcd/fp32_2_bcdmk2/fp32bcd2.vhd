----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:14:40 04/24/2014 
-- Design Name: 
-- Module Name:    fp32bcd2 - fp32bcd 
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

package bcd_def is
  --OUTPUTS
  subtype digit is std_logic_vector(3 downto 0); -- 4 bits
  type bcddat is array (7 downto 0) of digit; -- Output bcd value
  type bcdind is array (1 downto 0) of digit; -- Output bcd Standard Form
  --WORKING
  subtype unsdigit is unsigned(3 downto 0); -- 4 bits unsigned
  type bcdOP is array (38 downto 0) of unsdigit; -- unsigned bcd for operations
  type int_array is array (0 to 2) of integer; -- integer array 3 wide for loopcounter registers
end;

use work.bcd_def.all;

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity fp32bcd2 is
    Port ( --CONTROL
			  clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           start_conv : in  STD_LOGIC;
           ready : out  STD_LOGIC;
           done_tick : out  STD_LOGIC;
			  
			  --DATA INPUT
           fp32 : in  STD_LOGIC_VECTOR(31 downto 0); -- 32 bits
			  
			  --DATA OUTPUT
			  --type bcdvalue is array (39 downto 0) of std_logic_vector(3 downto 0);
--			  bcds : bcdvalue;
--			  type sulv2d is array(natural range<>, natural range<>) of std_logic_vector;
--			  input : in sulv2d(39 downto 0,3 downto 0);
			  bcds : out bcddat;
			  bcdindex : out bcdind;
           --bcd : out  STD_LOGIC;
           sign : out  STD_LOGIC);
			  
end fp32bcd2;

architecture fp32bcd of fp32bcd2 is
--States
	type state_type is (idle, assign, bin_2_bcd, check_five, assign_frac, done);
	signal state_reg, state_next: state_type;
	--Registers
	signal fp32_reg, fp32_next: std_logic_vector(31 downto 0);
	signal bcd_reg, bcd_next: bcddat;
	signal sign_reg, sign_next: std_logic;
	signal loopcounter_reg, loopcounter_next: int_array;
	  --Operation Signals
	  
	  signal fp32_mantissa_reg, fp32_mantissa_next: std_logic_vector(23 downto 0); -- 23 bits + invisible bit
	  signal fp32_exponent_reg, fp32_exponent_next: unsigned(7 downto 0); -- 8 bits
	  
	  signal fp32_intsect_reg, fp32_intsect_next: unsigned(23 downto 0); -- integer section of the mantissa
	  signal fp32_fracsect_reg, fp32_fracsect_next: unsigned(23 downto 0); -- fractional section of the mantissa
	  
	  signal fp32_datastartpoint: integer; -- from RHS
	  
	  signal bcdOPdat_reg, bcdOPdat_next: bcdOP; -- Operation variable
	  
	  
	
begin
--state and register updates
	--CONTROL process, acts simultaneously with calculation process below
	process(clk, reset)
	begin
		if reset='1' then --Nullify registers
			state_reg <= idle;
			fp32_reg <= (others=>'0');
			bcd_reg <= (others=>(others=>'0')); -- define to zero for a 2D array
			loopcounter_reg(0) <= 0;
			loopcounter_reg(1) <= 0;
			loopcounter_reg(2) <= 0;
			fp32_intsect_reg <= (others=>'0');
			fp32_fracsect_reg <= (others=>'0');
			
			fp32_mantissa_reg <= (others=>'0');
			fp32_exponent_reg <= (others=>'0');
			
			bcdOPdat_reg <= (others=>(others=>'0'));
			--ConvData <= (others=>'0');
			sign_reg <= '0';
		elsif (clk'event and clk='1') then --Update registers
			state_reg <= state_next;
			fp32_reg <= fp32_next;
			bcd_reg <= bcd_next;
			sign_reg <= sign_next;
			loopcounter_reg <= loopcounter_next;
--			loopcounter_reg(0) <= loopcounter_next(0);
--			loopcounter_reg(1) <= loopcounter_next(1);
--			loopcounter_reg(2) <= loopcounter_next(2);
			fp32_intsect_reg <= fp32_intsect_next;
			fp32_fracsect_reg <= fp32_fracsect_next;

			fp32_mantissa_reg <= fp32_mantissa_next;
			fp32_exponent_reg <= fp32_exponent_next;
			
			bcdOPdat_reg <= bcdOPdat_next;
		end if;
	end process;
	
	--Data operation process 1
	--sensitive to all regs being operated on, and input to-be-operated, and start_conv
	process(state_reg, fp32_reg, bcdOPdat_reg, bcd_reg, sign_reg, loopcounter_reg, start_conv, fp32, fp32_mantissa_reg, fp32_intsect_reg, fp32_fracsect_reg)
			--Attempt at a real variable to make things easier
			--variable fp32_exponent: unsigned(7 downto 0); -- When or If I have time
			variable outcount: integer; --Obtains the leftmost digit of the data to be output
		begin
			--preset everything. Nope. Apparently something else that makes it work that I don't understand
			ready<='0'; --Its doing stuff now.
			done_tick<='0'; --It's not done yet.
			state_next <= state_reg;
			fp32_next <= fp32_reg;
			bcd_next <= bcd_reg;
			sign_next <= sign_reg;
			loopcounter_next <= loopcounter_reg;
			fp32_mantissa_next <= fp32_mantissa_reg;
			bcdOPdat_next <= bcdOPdat_reg;
		case state_reg is
			when idle => --Accept input.
				ready<='1';
				if start_conv='1' then

					
					
					state_next <= assign;
				end if;
			when assign =>
				--We only want to output 8 BCD digits
				--If the fp32_intsect makes 8 digits, no point doing the fraction.
				fp32_exponent_next <= (unsigned(fp32_reg(30 downto 23)) - "01111111"); --etc etc
				--fp32_exponent:=unsigned(fp32_reg(30 downto 23)) - "01111111";
				if fp32_exponent_next>=0 then --positive exponent (or zero)
					if fp32_exponent_next<23 then -- Fractional part exists but may not be needed, also no added zeros
						if fp32_exponent_next=0 then
							fp32_intsect_next(0 downto 0) <= '1'; -- zero exponent, so just invisible bit
							loopcounter_next(0) <= '0'; -- One shift for one bit
							loopcounter_next(1) <= 0; -- No extra zeroes
						else
							fp32_intsect_next(to_integer(fp32_exponent_next) downto 0) <= '1' & unsigned(fp32_reg(22 downto (22-to_integer(fp32_exponent_next))));
							loopcounter_next(0) <= to_integer(fp32_exponent_next); --left shift for the number of bits
							loopcounter_next(1) <= 0; -- No extra zeroes
						end if;
					else -- No fractional part, incl. added zeroes.
						fp32_intsect_next(23 downto 0) <= '1' & unsigned(fp32_reg(22 downto 0));
						loopcounter_next(0) <= 23; --left shift for the number of original bits
						loopcounter_next(1) <= to_integer(fp32_exponent_next)-23; -- Then add some zeroes
					end if;
					
					state_next <= bin_2_bcd; --Convert intsect to bcd
				else --negative exponent
					--GOTO nasty fractional bit
					state_next <= assign_frac;
				end if;
				
				-- Zero Operation Register
				bcdOPdat_next <= (others=>(others=>'0')); -- Preset Operation register to zero
				
				--NULL CODE
				--________________________________
--				if loopcounter_reg > 6 then
--					state_next <= fp32tobcd;
--				else
--					loopcounter_next <= loopcounter_reg + 1;
--				end if;
				--________________________________
				--bcdOPdat(0)(0)<='1'; --DEBUG
			when bin_2_bcd =>
				--loopcounter_reg(0) goes from <exponent> downto 0
				--Algorithm. Shift into BCD.
				--LEFT SHIFT ALL
				for i in 38 downto 1 loop
						bcdOPdat_next(i)<=bcdOPdat_reg(i) sll 1; -- left shift 1
						bcdOPdat_next(i)(0)<=bcdOPdat_reg(i-1)(3); -- Assign left-most bit from next one along to right-most digit
				end loop;
				-- Draw digit from mantissa
				bcdOPdat_next(0)<=bcdOPdat_reg(0) sll 1;
				if fp32_exponent_reg < 24 then
					
				else
				if loopcounter_reg(0)<1 AND loopcounter_reg(1)<1 then
					bcdOPdat_next(0)(0)<=fp32_intsect_reg(loopcounter_reg(0)); -- Don't forget the last value
					state_next<=done;
				elsif loopcounter_reg(1)>0 AND loopcounter_reg(0)<1 then --ADD EXTRA ZEROES
					bcdOPdat_next(0)(0)<='0';
					loopcounter_next(1) <= loopcounter_reg(1)-1;
					state_next<=check_five; -- scan for BCD values > 4, add 3.
				elsif loopcounter_reg(0)>0 then --PULL FROM INTSECT
					bcdOPdat_next(0)(0)<=fp32_intsect_reg(loopcounter_reg(0));
					loopcounter_next(0) <= loopcounter_reg(0)-1;
					state_next<=check_five; -- scan for BCD values > 4, add 3.
				end if;
			when check_five =>
				for i in 38 downto 0 loop
					if bcdOPdat_reg(i) > 4 then
						bcdOPdat_next(i)<=bcdOPdat_reg(i)+"0011";
					end if;
				end loop;
				state_next <= bin_2_bcd;
			when assign_frac =>
				state_next <= done;
			when done =>
				--Find furthest left BCD digit that is non-zero
				outcount:=0;
				for i in 38 downto 0 loop
					if bcdOPdat_reg(i)!="0000" then
						outcount:=i;
						exit;
					end if;
				end loop;
				--FOUND
				--Check to see if fraction is needed, assign part of answer if yes, if no assign full answer and finish
				if outcount<7 then --outcount less than 7, therefore less than 8 digits, output first part, then go do fractional section.
					for i in 7 downto 7-outcount loop
						bcd_next(i)<=std_logic_vector(bcdOPdat_reg(outcount-(7-i)));
					end loop;
				else
					for i in 7 downto 0 loop
						bcd_next(i)<=std_logic_vector(bcdOPdat_reg(outcount-(7-i)));
					end loop;
					--Output remaining as exp
				done_tick <= '1';
				state_next <= idle;
	end case;
	end process;
	bcds <= bcd_reg;
	sign <= sign_reg;
end fp32bcd;

--_______________________________________________________________
--NULL CODE
--_______________________________________________________________
--if fp32_exponent_next>0 AND fp32_exponent_next<23 then -- Fractional part exists, also no added zeros
--elsif fp32_exponent_next>22 then -- No fractional part, incl. added zeroes.
--fp32_intsect_next(23 downto 0) <= '1' & unsigned(fp32_reg(22 downto 0));