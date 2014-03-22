----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:27:35 03/18/2014 
-- Design Name: 
-- Module Name:    add_w_carry - const_arch 
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

entity add_w_carry is
    Port ( a, b : in  STD_LOGIC_VECTOR (3 downto 0);
           cout : out  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR (3 downto 0));
end add_w_carry;

architecture const_arch of add_w_carry is
	constant N: integer:= 4;
	signal a_ext, b_ext, sum_ext: unsigned(N downto 0);
begin
	a_ext <= unsigned('0' & a);
	b_ext <= unsigned('0' & b);
	sum_ext <= a_ext + b_ext;
	sum <= std_logic_vector(sum_ext(N-1 downto 0));
	cout <= sum_ext(N);
end const_arch;

