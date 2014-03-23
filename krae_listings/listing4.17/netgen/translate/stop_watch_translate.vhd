--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: stop_watch_translate.vhd
-- /___/   /\     Timestamp: Sun Mar 23 11:40:54 2014
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -rpw 100 -tpw 0 -ar Structure -tm stop_watch -w -dir netgen/translate -ofmt vhdl -sim stop_watch.ngd stop_watch_translate.vhd 
-- Device	: 3s200ft256-5
-- Input file	: stop_watch.ngd
-- Output file	: /mnt/linux-data/opt/xilinx/projects/listing4.17/netgen/translate/stop_watch_translate.vhd
-- # of Entities	: 1
-- Design Name	: stop_watch
-- Xilinx	: /mnt/linux-data/opt/xilinx/14.7/ISE_DS/ISE/
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library SIMPRIM;
use SIMPRIM.VCOMPONENTS.ALL;
use SIMPRIM.VPACKAGE.ALL;

entity stop_watch is
  port (
    clk : in STD_LOGIC := 'X'; 
    clr : in STD_LOGIC := 'X'; 
    go : in STD_LOGIC := 'X'; 
    d0 : out STD_LOGIC_VECTOR ( 3 downto 0 ); 
    d1 : out STD_LOGIC_VECTOR ( 3 downto 0 ); 
    d2 : out STD_LOGIC_VECTOR ( 3 downto 0 ) 
  );
end stop_watch;

architecture Structure of stop_watch is
  signal Mcount_ms_reg_cy_10_rt_5 : STD_LOGIC; 
  signal Mcount_ms_reg_cy_11_rt_7 : STD_LOGIC; 
  signal Mcount_ms_reg_cy_12_rt_9 : STD_LOGIC; 
  signal Mcount_ms_reg_cy_13_rt_11 : STD_LOGIC; 
  signal Mcount_ms_reg_cy_14_rt_13 : STD_LOGIC; 
  signal Mcount_ms_reg_cy_15_rt_15 : STD_LOGIC; 
  signal Mcount_ms_reg_cy_16_rt_17 : STD_LOGIC; 
  signal Mcount_ms_reg_cy_17_rt_19 : STD_LOGIC; 
  signal Mcount_ms_reg_cy_18_rt_21 : STD_LOGIC; 
  signal Mcount_ms_reg_cy_19_rt_23 : STD_LOGIC; 
  signal Mcount_ms_reg_cy_1_rt_25 : STD_LOGIC; 
  signal Mcount_ms_reg_cy_20_rt_27 : STD_LOGIC; 
  signal Mcount_ms_reg_cy_21_rt_29 : STD_LOGIC; 
  signal Mcount_ms_reg_cy_2_rt_31 : STD_LOGIC; 
  signal Mcount_ms_reg_cy_3_rt_33 : STD_LOGIC; 
  signal Mcount_ms_reg_cy_4_rt_35 : STD_LOGIC; 
  signal Mcount_ms_reg_cy_5_rt_37 : STD_LOGIC; 
  signal Mcount_ms_reg_cy_6_rt_39 : STD_LOGIC; 
  signal Mcount_ms_reg_cy_7_rt_41 : STD_LOGIC; 
  signal Mcount_ms_reg_cy_8_rt_43 : STD_LOGIC; 
  signal Mcount_ms_reg_cy_9_rt_45 : STD_LOGIC; 
  signal Mcount_ms_reg_xor_22_rt_47 : STD_LOGIC; 
  signal N0 : STD_LOGIC; 
  signal N01 : STD_LOGIC; 
  signal N1 : STD_LOGIC; 
  signal N10 : STD_LOGIC; 
  signal N12 : STD_LOGIC; 
  signal N14 : STD_LOGIC; 
  signal N16 : STD_LOGIC; 
  signal N18 : STD_LOGIC; 
  signal N20 : STD_LOGIC; 
  signal N21 : STD_LOGIC; 
  signal N8 : STD_LOGIC; 
  signal Result_0_1 : STD_LOGIC; 
  signal Result_0_2 : STD_LOGIC; 
  signal Result_0_3 : STD_LOGIC; 
  signal Result_1_1 : STD_LOGIC; 
  signal Result_1_2 : STD_LOGIC; 
  signal Result_1_3 : STD_LOGIC; 
  signal Result_2_1 : STD_LOGIC; 
  signal Result_2_2 : STD_LOGIC; 
  signal Result_2_3 : STD_LOGIC; 
  signal Result_3_1 : STD_LOGIC; 
  signal Result_3_2 : STD_LOGIC; 
  signal Result_3_3 : STD_LOGIC; 
  signal clk_BUFGP : STD_LOGIC; 
  signal clr_IBUF_97 : STD_LOGIC; 
  signal d0_en : STD_LOGIC; 
  signal d0_reg_or0000 : STD_LOGIC; 
  signal d1_en : STD_LOGIC; 
  signal d1_reg_or0000 : STD_LOGIC; 
  signal d2_en : STD_LOGIC; 
  signal d2_reg_or0000_127 : STD_LOGIC; 
  signal go_IBUF_129 : STD_LOGIC; 
  signal ms_reg_or0000 : STD_LOGIC; 
  signal d2_en_and0000_SW0_O : STD_LOGIC; 
  signal d2_en_and0000_SW1_O : STD_LOGIC; 
  signal clk_BUFGP_IBUFG_2 : STD_LOGIC; 
  signal GND : STD_LOGIC; 
  signal Mcount_ms_reg_cy : STD_LOGIC_VECTOR ( 21 downto 0 ); 
  signal Mcount_ms_reg_lut : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal Result : STD_LOGIC_VECTOR ( 22 downto 0 ); 
  signal d0_reg : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal d1_reg : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal d2_reg : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal ms_reg : STD_LOGIC_VECTOR ( 22 downto 0 ); 
  signal ms_tick_cmp_eq0000_wg_cy : STD_LOGIC_VECTOR ( 4 downto 0 ); 
  signal ms_tick_cmp_eq0000_wg_lut : STD_LOGIC_VECTOR ( 5 downto 0 ); 
begin
  XST_GND : X_ZERO
    port map (
      O => N0
    );
  XST_VCC : X_ONE
    port map (
      O => N1
    );
  d0_reg_0 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => d0_en,
      I => Result(0),
      SRST => d0_reg_or0000,
      O => d0_reg(0),
      SET => GND,
      RST => GND,
      SSET => GND
    );
  d0_reg_1 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => d0_en,
      I => Result(1),
      SRST => d0_reg_or0000,
      O => d0_reg(1),
      SET => GND,
      RST => GND,
      SSET => GND
    );
  d0_reg_2 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => d0_en,
      I => Result(2),
      SRST => d0_reg_or0000,
      O => d0_reg(2),
      SET => GND,
      RST => GND,
      SSET => GND
    );
  d0_reg_3 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => d0_en,
      I => Result(3),
      SRST => d0_reg_or0000,
      O => d0_reg(3),
      SET => GND,
      RST => GND,
      SSET => GND
    );
  d1_reg_0 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => d1_en,
      I => Result_0_1,
      SRST => d1_reg_or0000,
      O => d1_reg(0),
      SET => GND,
      RST => GND,
      SSET => GND
    );
  d1_reg_1 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => d1_en,
      I => Result_1_1,
      SRST => d1_reg_or0000,
      O => d1_reg(1),
      SET => GND,
      RST => GND,
      SSET => GND
    );
  d1_reg_2 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => d1_en,
      I => Result_2_1,
      SRST => d1_reg_or0000,
      O => d1_reg(2),
      SET => GND,
      RST => GND,
      SSET => GND
    );
  d1_reg_3 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => d1_en,
      I => Result_3_1,
      SRST => d1_reg_or0000,
      O => d1_reg(3),
      SET => GND,
      RST => GND,
      SSET => GND
    );
  d2_reg_0 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => d2_en,
      I => Result_0_2,
      SRST => d2_reg_or0000_127,
      O => d2_reg(0),
      SET => GND,
      RST => GND,
      SSET => GND
    );
  d2_reg_1 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => d2_en,
      I => Result_1_2,
      SRST => d2_reg_or0000_127,
      O => d2_reg(1),
      SET => GND,
      RST => GND,
      SSET => GND
    );
  d2_reg_2 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => d2_en,
      I => Result_2_2,
      SRST => d2_reg_or0000_127,
      O => d2_reg(2),
      SET => GND,
      RST => GND,
      SSET => GND
    );
  d2_reg_3 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => d2_en,
      I => Result_3_2,
      SRST => d2_reg_or0000_127,
      O => d2_reg(3),
      SET => GND,
      RST => GND,
      SSET => GND
    );
  ms_reg_0 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => go_IBUF_129,
      I => Result_0_3,
      SRST => ms_reg_or0000,
      O => ms_reg(0),
      SET => GND,
      RST => GND,
      SSET => GND
    );
  ms_reg_1 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => go_IBUF_129,
      I => Result_1_3,
      SRST => ms_reg_or0000,
      O => ms_reg(1),
      SET => GND,
      RST => GND,
      SSET => GND
    );
  ms_reg_2 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => go_IBUF_129,
      I => Result_2_3,
      SRST => ms_reg_or0000,
      O => ms_reg(2),
      SET => GND,
      RST => GND,
      SSET => GND
    );
  ms_reg_3 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => go_IBUF_129,
      I => Result_3_3,
      SRST => ms_reg_or0000,
      O => ms_reg(3),
      SET => GND,
      RST => GND,
      SSET => GND
    );
  ms_reg_4 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => go_IBUF_129,
      I => Result(4),
      SRST => ms_reg_or0000,
      O => ms_reg(4),
      SET => GND,
      RST => GND,
      SSET => GND
    );
  ms_reg_5 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => go_IBUF_129,
      I => Result(5),
      SRST => ms_reg_or0000,
      O => ms_reg(5),
      SET => GND,
      RST => GND,
      SSET => GND
    );
  ms_reg_6 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => go_IBUF_129,
      I => Result(6),
      SRST => ms_reg_or0000,
      O => ms_reg(6),
      SET => GND,
      RST => GND,
      SSET => GND
    );
  ms_reg_7 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => go_IBUF_129,
      I => Result(7),
      SRST => ms_reg_or0000,
      O => ms_reg(7),
      SET => GND,
      RST => GND,
      SSET => GND
    );
  ms_reg_8 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => go_IBUF_129,
      I => Result(8),
      SRST => ms_reg_or0000,
      O => ms_reg(8),
      SET => GND,
      RST => GND,
      SSET => GND
    );
  ms_reg_9 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => go_IBUF_129,
      I => Result(9),
      SRST => ms_reg_or0000,
      O => ms_reg(9),
      SET => GND,
      RST => GND,
      SSET => GND
    );
  ms_reg_10 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => go_IBUF_129,
      I => Result(10),
      SRST => ms_reg_or0000,
      O => ms_reg(10),
      SET => GND,
      RST => GND,
      SSET => GND
    );
  ms_reg_11 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => go_IBUF_129,
      I => Result(11),
      SRST => ms_reg_or0000,
      O => ms_reg(11),
      SET => GND,
      RST => GND,
      SSET => GND
    );
  ms_reg_12 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => go_IBUF_129,
      I => Result(12),
      SRST => ms_reg_or0000,
      O => ms_reg(12),
      SET => GND,
      RST => GND,
      SSET => GND
    );
  ms_reg_13 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => go_IBUF_129,
      I => Result(13),
      SRST => ms_reg_or0000,
      O => ms_reg(13),
      SET => GND,
      RST => GND,
      SSET => GND
    );
  ms_reg_14 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => go_IBUF_129,
      I => Result(14),
      SRST => ms_reg_or0000,
      O => ms_reg(14),
      SET => GND,
      RST => GND,
      SSET => GND
    );
  ms_reg_15 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => go_IBUF_129,
      I => Result(15),
      SRST => ms_reg_or0000,
      O => ms_reg(15),
      SET => GND,
      RST => GND,
      SSET => GND
    );
  ms_reg_16 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => go_IBUF_129,
      I => Result(16),
      SRST => ms_reg_or0000,
      O => ms_reg(16),
      SET => GND,
      RST => GND,
      SSET => GND
    );
  ms_reg_17 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => go_IBUF_129,
      I => Result(17),
      SRST => ms_reg_or0000,
      O => ms_reg(17),
      SET => GND,
      RST => GND,
      SSET => GND
    );
  ms_reg_18 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => go_IBUF_129,
      I => Result(18),
      SRST => ms_reg_or0000,
      O => ms_reg(18),
      SET => GND,
      RST => GND,
      SSET => GND
    );
  ms_reg_19 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => go_IBUF_129,
      I => Result(19),
      SRST => ms_reg_or0000,
      O => ms_reg(19),
      SET => GND,
      RST => GND,
      SSET => GND
    );
  ms_reg_20 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => go_IBUF_129,
      I => Result(20),
      SRST => ms_reg_or0000,
      O => ms_reg(20),
      SET => GND,
      RST => GND,
      SSET => GND
    );
  ms_reg_21 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => go_IBUF_129,
      I => Result(21),
      SRST => ms_reg_or0000,
      O => ms_reg(21),
      SET => GND,
      RST => GND,
      SSET => GND
    );
  ms_reg_22 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => go_IBUF_129,
      I => Result(22),
      SRST => ms_reg_or0000,
      O => ms_reg(22),
      SET => GND,
      RST => GND,
      SSET => GND
    );
  Mcount_ms_reg_cy_0_Q : X_MUX2
    port map (
      IB => N0,
      IA => N1,
      SEL => Mcount_ms_reg_lut(0),
      O => Mcount_ms_reg_cy(0)
    );
  Mcount_ms_reg_xor_0_Q : X_XOR2
    port map (
      I0 => N0,
      I1 => Mcount_ms_reg_lut(0),
      O => Result_0_3
    );
  Mcount_ms_reg_cy_1_Q : X_MUX2
    port map (
      IB => Mcount_ms_reg_cy(0),
      IA => N0,
      SEL => Mcount_ms_reg_cy_1_rt_25,
      O => Mcount_ms_reg_cy(1)
    );
  Mcount_ms_reg_xor_1_Q : X_XOR2
    port map (
      I0 => Mcount_ms_reg_cy(0),
      I1 => Mcount_ms_reg_cy_1_rt_25,
      O => Result_1_3
    );
  Mcount_ms_reg_cy_2_Q : X_MUX2
    port map (
      IB => Mcount_ms_reg_cy(1),
      IA => N0,
      SEL => Mcount_ms_reg_cy_2_rt_31,
      O => Mcount_ms_reg_cy(2)
    );
  Mcount_ms_reg_xor_2_Q : X_XOR2
    port map (
      I0 => Mcount_ms_reg_cy(1),
      I1 => Mcount_ms_reg_cy_2_rt_31,
      O => Result_2_3
    );
  Mcount_ms_reg_cy_3_Q : X_MUX2
    port map (
      IB => Mcount_ms_reg_cy(2),
      IA => N0,
      SEL => Mcount_ms_reg_cy_3_rt_33,
      O => Mcount_ms_reg_cy(3)
    );
  Mcount_ms_reg_xor_3_Q : X_XOR2
    port map (
      I0 => Mcount_ms_reg_cy(2),
      I1 => Mcount_ms_reg_cy_3_rt_33,
      O => Result_3_3
    );
  Mcount_ms_reg_cy_4_Q : X_MUX2
    port map (
      IB => Mcount_ms_reg_cy(3),
      IA => N0,
      SEL => Mcount_ms_reg_cy_4_rt_35,
      O => Mcount_ms_reg_cy(4)
    );
  Mcount_ms_reg_xor_4_Q : X_XOR2
    port map (
      I0 => Mcount_ms_reg_cy(3),
      I1 => Mcount_ms_reg_cy_4_rt_35,
      O => Result(4)
    );
  Mcount_ms_reg_cy_5_Q : X_MUX2
    port map (
      IB => Mcount_ms_reg_cy(4),
      IA => N0,
      SEL => Mcount_ms_reg_cy_5_rt_37,
      O => Mcount_ms_reg_cy(5)
    );
  Mcount_ms_reg_xor_5_Q : X_XOR2
    port map (
      I0 => Mcount_ms_reg_cy(4),
      I1 => Mcount_ms_reg_cy_5_rt_37,
      O => Result(5)
    );
  Mcount_ms_reg_cy_6_Q : X_MUX2
    port map (
      IB => Mcount_ms_reg_cy(5),
      IA => N0,
      SEL => Mcount_ms_reg_cy_6_rt_39,
      O => Mcount_ms_reg_cy(6)
    );
  Mcount_ms_reg_xor_6_Q : X_XOR2
    port map (
      I0 => Mcount_ms_reg_cy(5),
      I1 => Mcount_ms_reg_cy_6_rt_39,
      O => Result(6)
    );
  Mcount_ms_reg_cy_7_Q : X_MUX2
    port map (
      IB => Mcount_ms_reg_cy(6),
      IA => N0,
      SEL => Mcount_ms_reg_cy_7_rt_41,
      O => Mcount_ms_reg_cy(7)
    );
  Mcount_ms_reg_xor_7_Q : X_XOR2
    port map (
      I0 => Mcount_ms_reg_cy(6),
      I1 => Mcount_ms_reg_cy_7_rt_41,
      O => Result(7)
    );
  Mcount_ms_reg_cy_8_Q : X_MUX2
    port map (
      IB => Mcount_ms_reg_cy(7),
      IA => N0,
      SEL => Mcount_ms_reg_cy_8_rt_43,
      O => Mcount_ms_reg_cy(8)
    );
  Mcount_ms_reg_xor_8_Q : X_XOR2
    port map (
      I0 => Mcount_ms_reg_cy(7),
      I1 => Mcount_ms_reg_cy_8_rt_43,
      O => Result(8)
    );
  Mcount_ms_reg_cy_9_Q : X_MUX2
    port map (
      IB => Mcount_ms_reg_cy(8),
      IA => N0,
      SEL => Mcount_ms_reg_cy_9_rt_45,
      O => Mcount_ms_reg_cy(9)
    );
  Mcount_ms_reg_xor_9_Q : X_XOR2
    port map (
      I0 => Mcount_ms_reg_cy(8),
      I1 => Mcount_ms_reg_cy_9_rt_45,
      O => Result(9)
    );
  Mcount_ms_reg_cy_10_Q : X_MUX2
    port map (
      IB => Mcount_ms_reg_cy(9),
      IA => N0,
      SEL => Mcount_ms_reg_cy_10_rt_5,
      O => Mcount_ms_reg_cy(10)
    );
  Mcount_ms_reg_xor_10_Q : X_XOR2
    port map (
      I0 => Mcount_ms_reg_cy(9),
      I1 => Mcount_ms_reg_cy_10_rt_5,
      O => Result(10)
    );
  Mcount_ms_reg_cy_11_Q : X_MUX2
    port map (
      IB => Mcount_ms_reg_cy(10),
      IA => N0,
      SEL => Mcount_ms_reg_cy_11_rt_7,
      O => Mcount_ms_reg_cy(11)
    );
  Mcount_ms_reg_xor_11_Q : X_XOR2
    port map (
      I0 => Mcount_ms_reg_cy(10),
      I1 => Mcount_ms_reg_cy_11_rt_7,
      O => Result(11)
    );
  Mcount_ms_reg_cy_12_Q : X_MUX2
    port map (
      IB => Mcount_ms_reg_cy(11),
      IA => N0,
      SEL => Mcount_ms_reg_cy_12_rt_9,
      O => Mcount_ms_reg_cy(12)
    );
  Mcount_ms_reg_xor_12_Q : X_XOR2
    port map (
      I0 => Mcount_ms_reg_cy(11),
      I1 => Mcount_ms_reg_cy_12_rt_9,
      O => Result(12)
    );
  Mcount_ms_reg_cy_13_Q : X_MUX2
    port map (
      IB => Mcount_ms_reg_cy(12),
      IA => N0,
      SEL => Mcount_ms_reg_cy_13_rt_11,
      O => Mcount_ms_reg_cy(13)
    );
  Mcount_ms_reg_xor_13_Q : X_XOR2
    port map (
      I0 => Mcount_ms_reg_cy(12),
      I1 => Mcount_ms_reg_cy_13_rt_11,
      O => Result(13)
    );
  Mcount_ms_reg_cy_14_Q : X_MUX2
    port map (
      IB => Mcount_ms_reg_cy(13),
      IA => N0,
      SEL => Mcount_ms_reg_cy_14_rt_13,
      O => Mcount_ms_reg_cy(14)
    );
  Mcount_ms_reg_xor_14_Q : X_XOR2
    port map (
      I0 => Mcount_ms_reg_cy(13),
      I1 => Mcount_ms_reg_cy_14_rt_13,
      O => Result(14)
    );
  Mcount_ms_reg_cy_15_Q : X_MUX2
    port map (
      IB => Mcount_ms_reg_cy(14),
      IA => N0,
      SEL => Mcount_ms_reg_cy_15_rt_15,
      O => Mcount_ms_reg_cy(15)
    );
  Mcount_ms_reg_xor_15_Q : X_XOR2
    port map (
      I0 => Mcount_ms_reg_cy(14),
      I1 => Mcount_ms_reg_cy_15_rt_15,
      O => Result(15)
    );
  Mcount_ms_reg_cy_16_Q : X_MUX2
    port map (
      IB => Mcount_ms_reg_cy(15),
      IA => N0,
      SEL => Mcount_ms_reg_cy_16_rt_17,
      O => Mcount_ms_reg_cy(16)
    );
  Mcount_ms_reg_xor_16_Q : X_XOR2
    port map (
      I0 => Mcount_ms_reg_cy(15),
      I1 => Mcount_ms_reg_cy_16_rt_17,
      O => Result(16)
    );
  Mcount_ms_reg_cy_17_Q : X_MUX2
    port map (
      IB => Mcount_ms_reg_cy(16),
      IA => N0,
      SEL => Mcount_ms_reg_cy_17_rt_19,
      O => Mcount_ms_reg_cy(17)
    );
  Mcount_ms_reg_xor_17_Q : X_XOR2
    port map (
      I0 => Mcount_ms_reg_cy(16),
      I1 => Mcount_ms_reg_cy_17_rt_19,
      O => Result(17)
    );
  Mcount_ms_reg_cy_18_Q : X_MUX2
    port map (
      IB => Mcount_ms_reg_cy(17),
      IA => N0,
      SEL => Mcount_ms_reg_cy_18_rt_21,
      O => Mcount_ms_reg_cy(18)
    );
  Mcount_ms_reg_xor_18_Q : X_XOR2
    port map (
      I0 => Mcount_ms_reg_cy(17),
      I1 => Mcount_ms_reg_cy_18_rt_21,
      O => Result(18)
    );
  Mcount_ms_reg_cy_19_Q : X_MUX2
    port map (
      IB => Mcount_ms_reg_cy(18),
      IA => N0,
      SEL => Mcount_ms_reg_cy_19_rt_23,
      O => Mcount_ms_reg_cy(19)
    );
  Mcount_ms_reg_xor_19_Q : X_XOR2
    port map (
      I0 => Mcount_ms_reg_cy(18),
      I1 => Mcount_ms_reg_cy_19_rt_23,
      O => Result(19)
    );
  Mcount_ms_reg_cy_20_Q : X_MUX2
    port map (
      IB => Mcount_ms_reg_cy(19),
      IA => N0,
      SEL => Mcount_ms_reg_cy_20_rt_27,
      O => Mcount_ms_reg_cy(20)
    );
  Mcount_ms_reg_xor_20_Q : X_XOR2
    port map (
      I0 => Mcount_ms_reg_cy(19),
      I1 => Mcount_ms_reg_cy_20_rt_27,
      O => Result(20)
    );
  Mcount_ms_reg_cy_21_Q : X_MUX2
    port map (
      IB => Mcount_ms_reg_cy(20),
      IA => N0,
      SEL => Mcount_ms_reg_cy_21_rt_29,
      O => Mcount_ms_reg_cy(21)
    );
  Mcount_ms_reg_xor_21_Q : X_XOR2
    port map (
      I0 => Mcount_ms_reg_cy(20),
      I1 => Mcount_ms_reg_cy_21_rt_29,
      O => Result(21)
    );
  Mcount_ms_reg_xor_22_Q : X_XOR2
    port map (
      I0 => Mcount_ms_reg_cy(21),
      I1 => Mcount_ms_reg_xor_22_rt_47,
      O => Result(22)
    );
  ms_tick_cmp_eq0000_wg_lut_0_Q : X_LUT3
    generic map(
      INIT => X"02"
    )
    port map (
      ADR0 => ms_reg(8),
      ADR1 => ms_reg(4),
      ADR2 => ms_reg(6),
      O => ms_tick_cmp_eq0000_wg_lut(0)
    );
  ms_tick_cmp_eq0000_wg_cy_0_Q : X_MUX2
    port map (
      IB => N1,
      IA => N0,
      SEL => ms_tick_cmp_eq0000_wg_lut(0),
      O => ms_tick_cmp_eq0000_wg_cy(0)
    );
  ms_tick_cmp_eq0000_wg_lut_1_Q : X_LUT4
    generic map(
      INIT => X"2000"
    )
    port map (
      ADR0 => ms_reg(7),
      ADR1 => ms_reg(11),
      ADR2 => ms_reg(3),
      ADR3 => ms_reg(9),
      O => ms_tick_cmp_eq0000_wg_lut(1)
    );
  ms_tick_cmp_eq0000_wg_cy_1_Q : X_MUX2
    port map (
      IB => ms_tick_cmp_eq0000_wg_cy(0),
      IA => N0,
      SEL => ms_tick_cmp_eq0000_wg_lut(1),
      O => ms_tick_cmp_eq0000_wg_cy(1)
    );
  ms_tick_cmp_eq0000_wg_lut_2_Q : X_LUT4
    generic map(
      INIT => X"0100"
    )
    port map (
      ADR0 => ms_reg(10),
      ADR1 => ms_reg(14),
      ADR2 => ms_reg(5),
      ADR3 => ms_reg(12),
      O => ms_tick_cmp_eq0000_wg_lut(2)
    );
  ms_tick_cmp_eq0000_wg_cy_2_Q : X_MUX2
    port map (
      IB => ms_tick_cmp_eq0000_wg_cy(1),
      IA => N0,
      SEL => ms_tick_cmp_eq0000_wg_lut(2),
      O => ms_tick_cmp_eq0000_wg_cy(2)
    );
  ms_tick_cmp_eq0000_wg_lut_3_Q : X_LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      ADR0 => ms_reg(13),
      ADR1 => ms_reg(17),
      ADR2 => ms_reg(1),
      ADR3 => ms_reg(15),
      O => ms_tick_cmp_eq0000_wg_lut(3)
    );
  ms_tick_cmp_eq0000_wg_cy_3_Q : X_MUX2
    port map (
      IB => ms_tick_cmp_eq0000_wg_cy(2),
      IA => N0,
      SEL => ms_tick_cmp_eq0000_wg_lut(3),
      O => ms_tick_cmp_eq0000_wg_cy(3)
    );
  ms_tick_cmp_eq0000_wg_lut_4_Q : X_LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      ADR0 => ms_reg(16),
      ADR1 => ms_reg(20),
      ADR2 => ms_reg(0),
      ADR3 => ms_reg(18),
      O => ms_tick_cmp_eq0000_wg_lut(4)
    );
  ms_tick_cmp_eq0000_wg_cy_4_Q : X_MUX2
    port map (
      IB => ms_tick_cmp_eq0000_wg_cy(3),
      IA => N0,
      SEL => ms_tick_cmp_eq0000_wg_lut(4),
      O => ms_tick_cmp_eq0000_wg_cy(4)
    );
  ms_tick_cmp_eq0000_wg_lut_5_Q : X_LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      ADR0 => ms_reg(19),
      ADR1 => ms_reg(21),
      ADR2 => ms_reg(2),
      ADR3 => ms_reg(22),
      O => ms_tick_cmp_eq0000_wg_lut(5)
    );
  ms_tick_cmp_eq0000_wg_cy_5_Q : X_MUX2
    port map (
      IB => ms_tick_cmp_eq0000_wg_cy(4),
      IA => N0,
      SEL => ms_tick_cmp_eq0000_wg_lut(5),
      O => d0_en
    );
  Mcount_d2_reg_xor_1_11 : X_LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      ADR0 => d2_reg(1),
      ADR1 => d2_reg(0),
      O => Result_1_2
    );
  Mcount_d1_reg_xor_1_11 : X_LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      ADR0 => d1_reg(1),
      ADR1 => d1_reg(0),
      O => Result_1_1
    );
  Mcount_d0_reg_xor_1_11 : X_LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      ADR0 => d0_reg(1),
      ADR1 => d0_reg(0),
      O => Result(1)
    );
  Mcount_d2_reg_xor_2_11 : X_LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      ADR0 => d2_reg(2),
      ADR1 => d2_reg(1),
      ADR2 => d2_reg(0),
      O => Result_2_2
    );
  Mcount_d1_reg_xor_2_11 : X_LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      ADR0 => d1_reg(2),
      ADR1 => d1_reg(1),
      ADR2 => d1_reg(0),
      O => Result_2_1
    );
  Mcount_d0_reg_xor_2_11 : X_LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      ADR0 => d0_reg(2),
      ADR1 => d0_reg(1),
      ADR2 => d0_reg(0),
      O => Result(2)
    );
  Mcount_d2_reg_xor_3_11 : X_LUT4
    generic map(
      INIT => X"6CCC"
    )
    port map (
      ADR0 => d2_reg(0),
      ADR1 => d2_reg(3),
      ADR2 => d2_reg(1),
      ADR3 => d2_reg(2),
      O => Result_3_2
    );
  Mcount_d1_reg_xor_3_11 : X_LUT4
    generic map(
      INIT => X"6CCC"
    )
    port map (
      ADR0 => d1_reg(0),
      ADR1 => d1_reg(3),
      ADR2 => d1_reg(1),
      ADR3 => d1_reg(2),
      O => Result_3_1
    );
  Mcount_d0_reg_xor_3_11 : X_LUT4
    generic map(
      INIT => X"6CCC"
    )
    port map (
      ADR0 => d0_reg(0),
      ADR1 => d0_reg(3),
      ADR2 => d0_reg(1),
      ADR3 => d0_reg(2),
      O => Result(3)
    );
  ms_reg_or00001 : X_LUT3
    generic map(
      INIT => X"EA"
    )
    port map (
      ADR0 => clr_IBUF_97,
      ADR1 => go_IBUF_129,
      ADR2 => d0_en,
      O => ms_reg_or0000
    );
  d2_reg_or00001 : X_LUT4
    generic map(
      INIT => X"0200"
    )
    port map (
      ADR0 => d0_reg(3),
      ADR1 => d0_reg(2),
      ADR2 => N01,
      ADR3 => d0_en,
      O => d1_en
    );
  clr_IBUF : X_BUF
    port map (
      I => clr,
      O => clr_IBUF_97
    );
  go_IBUF : X_BUF
    port map (
      I => go,
      O => go_IBUF_129
    );
  Mcount_ms_reg_cy_1_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ms_reg(1),
      O => Mcount_ms_reg_cy_1_rt_25,
      ADR1 => GND
    );
  Mcount_ms_reg_cy_2_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ms_reg(2),
      O => Mcount_ms_reg_cy_2_rt_31,
      ADR1 => GND
    );
  Mcount_ms_reg_cy_3_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ms_reg(3),
      O => Mcount_ms_reg_cy_3_rt_33,
      ADR1 => GND
    );
  Mcount_ms_reg_cy_4_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ms_reg(4),
      O => Mcount_ms_reg_cy_4_rt_35,
      ADR1 => GND
    );
  Mcount_ms_reg_cy_5_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ms_reg(5),
      O => Mcount_ms_reg_cy_5_rt_37,
      ADR1 => GND
    );
  Mcount_ms_reg_cy_6_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ms_reg(6),
      O => Mcount_ms_reg_cy_6_rt_39,
      ADR1 => GND
    );
  Mcount_ms_reg_cy_7_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ms_reg(7),
      O => Mcount_ms_reg_cy_7_rt_41,
      ADR1 => GND
    );
  Mcount_ms_reg_cy_8_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ms_reg(8),
      O => Mcount_ms_reg_cy_8_rt_43,
      ADR1 => GND
    );
  Mcount_ms_reg_cy_9_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ms_reg(9),
      O => Mcount_ms_reg_cy_9_rt_45,
      ADR1 => GND
    );
  Mcount_ms_reg_cy_10_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ms_reg(10),
      O => Mcount_ms_reg_cy_10_rt_5,
      ADR1 => GND
    );
  Mcount_ms_reg_cy_11_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ms_reg(11),
      O => Mcount_ms_reg_cy_11_rt_7,
      ADR1 => GND
    );
  Mcount_ms_reg_cy_12_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ms_reg(12),
      O => Mcount_ms_reg_cy_12_rt_9,
      ADR1 => GND
    );
  Mcount_ms_reg_cy_13_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ms_reg(13),
      O => Mcount_ms_reg_cy_13_rt_11,
      ADR1 => GND
    );
  Mcount_ms_reg_cy_14_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ms_reg(14),
      O => Mcount_ms_reg_cy_14_rt_13,
      ADR1 => GND
    );
  Mcount_ms_reg_cy_15_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ms_reg(15),
      O => Mcount_ms_reg_cy_15_rt_15,
      ADR1 => GND
    );
  Mcount_ms_reg_cy_16_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ms_reg(16),
      O => Mcount_ms_reg_cy_16_rt_17,
      ADR1 => GND
    );
  Mcount_ms_reg_cy_17_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ms_reg(17),
      O => Mcount_ms_reg_cy_17_rt_19,
      ADR1 => GND
    );
  Mcount_ms_reg_cy_18_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ms_reg(18),
      O => Mcount_ms_reg_cy_18_rt_21,
      ADR1 => GND
    );
  Mcount_ms_reg_cy_19_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ms_reg(19),
      O => Mcount_ms_reg_cy_19_rt_23,
      ADR1 => GND
    );
  Mcount_ms_reg_cy_20_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ms_reg(20),
      O => Mcount_ms_reg_cy_20_rt_27,
      ADR1 => GND
    );
  Mcount_ms_reg_cy_21_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ms_reg(21),
      O => Mcount_ms_reg_cy_21_rt_29,
      ADR1 => GND
    );
  Mcount_ms_reg_xor_22_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ms_reg(22),
      O => Mcount_ms_reg_xor_22_rt_47,
      ADR1 => GND
    );
  d2_reg_or00001_SW1 : X_LUT4
    generic map(
      INIT => X"FF7F"
    )
    port map (
      ADR0 => d1_reg(3),
      ADR1 => d0_reg(3),
      ADR2 => d1_reg(0),
      ADR3 => d0_reg(2),
      O => N10
    );
  d2_en_and0000 : X_LUT4
    generic map(
      INIT => X"0100"
    )
    port map (
      ADR0 => N01,
      ADR1 => N21,
      ADR2 => N10,
      ADR3 => d0_en,
      O => d2_en
    );
  d2_reg_or00001_SW2 : X_LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      ADR0 => d0_reg(3),
      ADR1 => d0_reg(2),
      O => N12
    );
  d0_reg_or00001 : X_LUT4
    generic map(
      INIT => X"AEAA"
    )
    port map (
      ADR0 => clr_IBUF_97,
      ADR1 => N12,
      ADR2 => N20,
      ADR3 => d0_en,
      O => d0_reg_or0000
    );
  d1_reg_or00001 : X_LUT4
    generic map(
      INIT => X"BAAA"
    )
    port map (
      ADR0 => clr_IBUF_97,
      ADR1 => N8,
      ADR2 => d0_en,
      ADR3 => N14,
      O => d1_reg_or0000
    );
  d2_reg_or0000 : X_LUT4
    generic map(
      INIT => X"BAAA"
    )
    port map (
      ADR0 => clr_IBUF_97,
      ADR1 => N8,
      ADR2 => d0_en,
      ADR3 => N16,
      O => d2_reg_or0000_127
    );
  d2_en_and0000_SW1_SW0 : X_LUT4
    generic map(
      INIT => X"FBFF"
    )
    port map (
      ADR0 => d2_reg(1),
      ADR1 => d2_reg(0),
      ADR2 => d0_reg(1),
      ADR3 => d0_reg(0),
      O => N18
    );
  Mcount_ms_reg_lut_0_INV_0 : X_INV
    port map (
      I => ms_reg(0),
      O => Mcount_ms_reg_lut(0)
    );
  Mcount_d2_reg_xor_0_11_INV_0 : X_INV
    port map (
      I => d2_reg(0),
      O => Result_0_2
    );
  Mcount_d1_reg_xor_0_11_INV_0 : X_INV
    port map (
      I => d1_reg(0),
      O => Result_0_1
    );
  Mcount_d0_reg_xor_0_11_INV_0 : X_INV
    port map (
      I => d0_reg(0),
      O => Result(0)
    );
  d2_reg_or00001_SW0_LUT2_D_BUF : X_BUF
    port map (
      I => N01,
      O => N20
    );
  d2_reg_or00001_SW0 : X_LUT2
    generic map(
      INIT => X"D"
    )
    port map (
      ADR0 => d0_reg(0),
      ADR1 => d0_reg(1),
      O => N01
    );
  d2_en_and0000_SW0_SW0_LUT2_D_BUF : X_BUF
    port map (
      I => N8,
      O => N21
    );
  d2_en_and0000_SW0_SW0 : X_LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      ADR0 => d1_reg(2),
      ADR1 => d1_reg(1),
      O => N8
    );
  d2_en_and0000_SW0_LUT3_L_BUF : X_BUF
    port map (
      I => d2_en_and0000_SW0_O,
      O => N14
    );
  d2_en_and0000_SW0 : X_LUT3
    generic map(
      INIT => X"04"
    )
    port map (
      ADR0 => d0_reg(1),
      ADR1 => d0_reg(0),
      ADR2 => N10,
      O => d2_en_and0000_SW0_O
    );
  d2_en_and0000_SW1_LUT4_L_BUF : X_BUF
    port map (
      I => d2_en_and0000_SW1_O,
      O => N16
    );
  d2_en_and0000_SW1 : X_LUT4
    generic map(
      INIT => X"0002"
    )
    port map (
      ADR0 => d2_reg(3),
      ADR1 => d2_reg(2),
      ADR2 => N18,
      ADR3 => N10,
      O => d2_en_and0000_SW1_O
    );
  clk_BUFGP_BUFG : X_CKBUF
    port map (
      I => clk_BUFGP_IBUFG_2,
      O => clk_BUFGP
    );
  clk_BUFGP_IBUFG : X_CKBUF
    port map (
      I => clk,
      O => clk_BUFGP_IBUFG_2
    );
  d0_0_OBUF : X_OBUF
    port map (
      I => d0_reg(0),
      O => d0(0)
    );
  d0_1_OBUF : X_OBUF
    port map (
      I => d0_reg(1),
      O => d0(1)
    );
  d0_2_OBUF : X_OBUF
    port map (
      I => d0_reg(2),
      O => d0(2)
    );
  d0_3_OBUF : X_OBUF
    port map (
      I => d0_reg(3),
      O => d0(3)
    );
  d1_0_OBUF : X_OBUF
    port map (
      I => d1_reg(0),
      O => d1(0)
    );
  d1_1_OBUF : X_OBUF
    port map (
      I => d1_reg(1),
      O => d1(1)
    );
  d1_2_OBUF : X_OBUF
    port map (
      I => d1_reg(2),
      O => d1(2)
    );
  d1_3_OBUF : X_OBUF
    port map (
      I => d1_reg(3),
      O => d1(3)
    );
  d2_0_OBUF : X_OBUF
    port map (
      I => d2_reg(0),
      O => d2(0)
    );
  d2_1_OBUF : X_OBUF
    port map (
      I => d2_reg(1),
      O => d2(1)
    );
  d2_2_OBUF : X_OBUF
    port map (
      I => d2_reg(2),
      O => d2(2)
    );
  d2_3_OBUF : X_OBUF
    port map (
      I => d2_reg(3),
      O => d2(3)
    );
  NlwBlock_stop_watch_GND : X_ZERO
    port map (
      O => GND
    );
  NlwBlockROC : X_ROC
    generic map (ROC_WIDTH => 100 ns)
    port map (O => GSR);
  NlwBlockTOC : X_TOC
    port map (O => GTS);

end Structure;

