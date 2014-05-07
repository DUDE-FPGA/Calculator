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
  subtype digit is std_logic_vector(3 downto 0); -- 4 bits
  type bcddat is array (7 downto 0) of digit; -- bcd value
  subtype unsdigit is unsigned(3 downto 0); -- 4 bits unsigned
  type bcdOP is array (7 downto 0) of unsdigit; -- unsigned bcd for operations
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
           --bcd : out  STD_LOGIC;
           sign : out  STD_LOGIC);
end fp32bcd2;

architecture fp32bcd of fp32bcd2 is
--States
	type state_type is (idle, assign, ext_iter,shift_arr, check_five, fp32tobcd, done);
	signal state_reg, state_next: state_type;
	--Registers
	signal fp32_reg, fp32_next: std_logic_vector(31 downto 0);
	signal bcd_reg, bcd_next: bcddat;
	signal sign_reg, sign_next: std_logic;
	signal loopcounter_reg, loopcounter_next: int_array;
	  --Operation Variables
	  signal fp32_mantissa_reg, fp32_mantissa_next: std_logic_vector(23 downto 0); -- 23 bits + invisible bit
	  
	  signal fp32_exponent: unsigned(7 downto 0); -- 8 bits
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
			fp32_mantissa_reg <= (others=>'0');
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
			fp32_mantissa_reg <= fp32_mantissa_next;
			bcdOPdat_reg <= bcdOPdat_next;
		end if;
	end process;
	
	--Data operation process 1
	--sensitive to all regs being operated on, and input to-be-operated, and start_conv
	process(state_reg, fp32_reg, bcdOPdat_reg, bcd_reg, sign_reg, loopcounter_reg, start_conv, fp32, fp32_mantissa_reg)
		begin
			--preset everything. Nope. Apparently something else that makes it work that I don;t understand
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
				fp32_next<=fp32; --OBSOLETION IN PROGRESS
				
				--Set mantissa to mantissa register --Add 'invisible bit'
				fp32_mantissa_next(23 downto 0) <= '1' & fp32(22 downto 0);
				
				--Set exponent: Doesn't do anything for now
					--fp32_exponent<=unsigned(fp32_reg(29 downto 23));
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
				
				state_next <= ext_iter;
				--bcdOPdat(0)(0)<='1'; --DEBUG
			when ext_iter =>
				--Check for negative value
				--'1' is minus, '0' is +ve
				if fp32_reg(31)='1' then
					sign_next<='1';
				else
					sign_next<='0';
				end if;
				
				-- This should go elsewhere. Don't know where yet. Doesn't matter for now.
--				if fp32_reg(30)='1' then --Number is > 1
--					
--				end if
				
			when fp32tobcd =>
				--Is first bit negative or not?
				--'1' is minus, '0' is +ve
				--Can go straight to BCD
				
				
				
				
				
				--Now, time to implement some crazy stuff
				--Convert exponential
				 --Check 1st bit: 1 is +ve exponent
				if fp32_reg(30)='1' then --Number is > 1
					--location of decimal point is remaining number + 1
					--fp32_exponent<=fp32_exponent+1;
					--Decode this somehow. How do I Binary to BCD?
					--That Algorithm. Should be started from the point at which the decimal point is located...
					--Or should it? Better from the poitn at which there is data, ie. the last data point OR the decimal point
					--Therefore determine which comes first. Never mind, may as well convert whole mantissa.
					
					--Start BCD conversion.
					
					--____________________________________________________________
					--Here we begin the Crazy algorithm. Will try to load it all into a loop here, but it may need an FSMD state of its own.
					--____________________________________________________________
					
					-- 24 bit input, therefore 24 shifts
					for i in 23 downto 0 loop
						-- left shift 1 - unnecessary, can just use loop ID to pull the bits from the mantissa
						-- loop should finish at the end of the dataset, therfore need first 1 from the RHS
						-- This is hard. Take the first bit of every set of 4 and shift it into the rhs of the one above
						-- Loop over all BCD subsets, to shift all left by 1
						-- Don't do all subsets - final subset needs to be drawn from the mantissa
						for j in 7 downto 1 loop
							bcdOPdat(j)<=bcdOPdat(j) sll 1; -- left shift 1
							bcdOPdat(j)(0)<=bcdOPdat(j-1)(3); -- Assign bit from next one along to right-most digit
						end loop;
						-- Draw digit from mantissa
						bcdOPdat(0)<=bcdOPdat(0) sll 1;
						bcdOPdat(0)(0)<=fp32_mantissa_reg(i);
						--Check all digit subsets :S
						--If > 4 then add 3.
						for j in 7 downto 0 loop
							if bcdOPdat(j) > 4 then
								bcdOPdat(j)<=bcdOPdat(j)+"0011";
							end if;
						end loop;
						
					end loop;
				else --Number is < 1, > 0
				
				end if;
				
				state_next<=done;
			when done =>
				for i in 7 downto 0 loop
					bcd_next(i)<=std_logic_vector(bcdOPdat(i));
				end loop;
				done_tick <= '1';
				state_next <= idle;
	end case;
	end process;
	bcds <= bcd_reg;
	sign <= sign_reg;
end fp32bcd;

