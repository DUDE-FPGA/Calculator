----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:57:18 03/23/2014 
-- Design Name: 
-- Module Name:    stop_watch - cascade_arch 
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

entity stop_watch is
    Port ( clk : in  STD_LOGIC;
           go, clr : in  STD_LOGIC;
           d2,d1,d0 : out  STD_LOGIC_VECTOR (3 downto 0));
end stop_watch;

architecture cascade_arch of stop_watch is
	constant DVSR: integer := 5000;
	signal ms_reg, ms_next: unsigned(22 downto 0);
	signal d2_reg, d1_reg, d0_reg: unsigned(3 downto 0);
	signal d2_next, d1_next, d0_next: unsigned(3 downto 0);
	signal d1_en, d2_en, d0_en: std_logic;
	signal ms_tick, d0_tick, d1_tick: std_logic;
begin
	--register
	process(clk)
	begin
		if (clk'event and clk='1') then
			ms_reg <= ms_next;
			d2_reg <= d2_next;
			d1_reg <= d1_next;
			d0_reg <= d0_next;
		end if;
	end process;
	
	-- next-state logic
	-- 0.1 sec tick gen with mod-5000000
	ms_next <=
		(others=>'0') when clr='1' or
								(ms_reg=DVSR and go='1') else
		ms_reg + 1 when go='1' else
		ms_reg;
	ms_tick <= '1' when ms_reg=DVSR else '0';
	--0.1 sec counter
	d0_en <= '1' when ms_tick='1' else '0';
	d0_next <=
		"0000" when (clr='1') or (d0_en='1' and d0_reg=9) else
		d0_reg + 1 when d0_en='1' else
		d0_reg;
	d0_tick <= '1' when d0_reg=9 else '0';
	-- 1 sec counter
	d1_en <= '1' when ms_tick='1' and d0_tick='1' else '0';
	d1_next <= 
		"0000" when (clr='1') or (d1_en='1' and d1_reg=9) else
		d1_reg + 1 when d1_en='1' else
		d1_reg;
	d1_tick <= '1' when d1_reg=9 else '0';
	-- 10 sec counter
	d2_en <=
		'1' when ms_tick='1' and d0_tick='1' and d1_tick='1' else
		'0';
	d2_next <=
		"0000" when (clr='1') or (d2_en='1' and d2_reg=9) else
		d2_reg + 1 when d2_en='1' else
		d2_reg;
		
	--output logic
	d0 <= std_logic_vector(d0_reg);
	d1 <= std_logic_vector(d1_reg);
	d2 <= std_logic_vector(d2_reg);

end cascade_arch;

