----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Shulyak
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
use IEEE.NUMERIC_STD.ALL;

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
	type state_type is (idle, assign, multi1, subtract, multi2, multi3, done);
	signal state_reg, state_next: state_type;
	signal fp1_mantissa_reg, fp1_mantissa_next: std_logic_vector(31 downto 0);
	signal exp_out_reg, exp_out_next: unsigned(7 downto 0);
	signal sign_out_reg, sign_out_next: std_logic;
	
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

	signal start_multi3_reg, start_multi3_next: std_logic;
	signal multi3_ready, multi3_done: std_logic;
	signal multi3_out: std_logic_vector(31 downto 0);
	
	--Newton Raphson signals
	signal xi_reg, xi_next: std_logic_vector(31 downto 0);
	signal d_reg, d_next: std_logic_vector(31 downto 0); -- Mantissa of divisor
	signal newt_counter_reg, newt_counter_next: integer;
	constant FP_1:
		std_logic_vector(31 downto 0):= "00111111100000000000000000000000"; -- No. 1 in FP format
	constant FP_2:
		std_logic_vector(31 downto 0):= "01000000000000000000000000000000"; -- No. 2 in FP format

begin
	--Registers
	process(clk, reset)
	begin
		if reset='1' then
			state_reg<=idle;
			start_adder_reg<='0';
			start_multi1_reg<='0';
			start_multi2_reg<='0';
			start_multi3_reg<='0';
			xi_reg<=(others=>'0');
			d_reg<=(others=>'0');
			newt_counter_reg<=0;
			fp1_mantissa_reg<=(others=>'0');
			exp_out_reg<=(others=>'0');
			sign_out_reg<='0';
			
		elsif(clk'event and clk='1') then
			state_reg<=state_next;
			start_adder_reg<=start_adder_next;
			start_multi1_reg<=start_multi1_next;
			start_multi2_reg<=start_multi2_next;
			start_multi3_reg<=start_multi3_next;
			xi_reg<=xi_next;
			d_reg<=d_next;
			newt_counter_reg<=newt_counter_next;
			fp1_mantissa_reg<=fp1_mantissa_next;
			exp_out_reg<=exp_out_next;
			sign_out_reg<=sign_out_next;
		end if;
	end process;
	
	-- Floating point unit instantiation
	fpu32_add_or_sub : entity work.fpu32_adder 
		port map(clk, reset, start_adder_reg, adder_done, adder_ready, FP_2, multi1_out, adder_out);
	fpu32_multi1 : entity work.fpu32_multiply
		port map(clk, reset, start_multi1_reg, multi1_done, multi1_ready, d_reg, xi_reg, multi1_out);
	fpu32_multi2 : entity work.fpu32_multiply
		port map(clk, reset, start_multi2_reg, multi2_done, multi2_ready, xi_reg, adder_out, multi2_out);	
	-- Multiplier for fp1 and Newton Raphson result for 1/fp2
	fpu32_multi3 : entity work.fpu32_multiply
		port map(clk, reset, start_multi3_reg, multi3_done, multi3_ready, multi2_out, fp1_mantissa_reg, multi3_out);
	
	-- FSMD next-state logic
	-- multi1, subtract and multi2 are newton-raphson states. The chain loops 5 times.
	process (fp1, fp2, start_adder_reg, start_multi1_reg, start_multi2_reg, start_multi3_reg, state_reg, 
	adder_ready, adder_done, multi1_ready, multi1_done, multi2_ready, multi2_done,
	multi3_ready, multi3_done, xi_reg, d_reg, newt_counter_reg, sign_out_reg, exp_out_reg)
	begin
		ready<='0';
		state_next<=state_reg;
		start_adder_next<=start_adder_reg;
		start_multi1_next<=start_multi1_reg;
		start_multi2_next<=start_multi2_reg;
		start_multi3_next<=start_multi3_reg;
		xi_next<=xi_reg;
		d_next<=d_reg;
		newt_counter_next<=newt_counter_reg;
		done_tick<='0';
		fp1_mantissa_next<=fp1_mantissa_reg;
		sign_out_next<=sign_out_reg;
		exp_out_next<=exp_out_reg;
		case state_reg is
			when idle =>
				ready<='1';
				if start='1' then 
					state_next<=assign;
				end if;
			when assign =>
				fp1_mantissa_next <= "001111110" & fp1(22 downto 0);
				d_next <= "101111110" & fp2(22 downto 0); --assign divisor mantissa and make FP format
				xi_next <= FP_1; --Initial guess for Newton Raphson
				sign_out_next<=fp1(31) xor fp2(31); --Check resultant sign
				exp_out_next<=
					(unsigned(fp1(30 downto 23))-"01111111") 
					- (unsigned(fp2(30 downto 23))-"01111111") + "01111111";
				state_next <= multi1;
			-- Equation for Newton Raphson is x_(i+1) = x_i * (2 - d*x_i)
			-- Initial x_i is set = 1 (in FP32 format)
			--------------------------------------
			-- Beginning of Newton Raphson Loop --
			--------------------------------------
			when multi1 =>
				if multi1_ready='1' then
					start_multi1_next<='1';
				elsif multi1_ready='0' then
					start_multi1_next<='0';
				end if;
				
				if multi1_done='1' then
					state_next<=subtract;
				end if;
			when subtract =>
				if adder_ready='1' then
					start_adder_next<='1';
				elsif adder_ready='0' then
					start_adder_next<='0';
				end if;
				
				if adder_done='1' then
					newt_counter_next<=newt_counter_reg+1;
					state_next<=multi2;
				end if;
			when multi2 =>
				if multi2_ready='1' then
					start_multi2_next<='1';
				elsif multi2_ready='0' then
					start_multi2_next<='0';
				end if;
				
				-- Loop states 5 times
				if multi2_done='1' and newt_counter_reg<6 then
					state_next<=multi1;
					xi_next<=multi2_out;
				elsif multi2_done='1' and newt_counter_reg>5 then
					state_next<=multi3;
				end if;
			--------------------------------------
			--     End of Newton Raphson Loop   --
			--------------------------------------				

			-- Multiply fp1 mantissa and the result of Newton Raphson
			when multi3 => 
				if multi3_ready='1' then
					start_multi3_next<='1';
				elsif multi3_ready='0' then
					start_multi3_next<='0';
				end if;
				
				if multi3_done='1' then
					state_next<=done;
				end if;
			when done =>
				fp_out<= sign_out_reg & std_logic_vector(exp_out_reg) & multi3_out(22 downto 0);
				done_tick<='1';
				state_next<=idle;
		end case;
	end process;
	

end divide;

