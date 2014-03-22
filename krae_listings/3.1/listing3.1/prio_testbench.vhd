-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY testbench IS
  END testbench;

  ARCHITECTURE behavior OF testbench IS 

      SIGNAL testin0 :  std_logic_vector(1 downto 0);
      SIGNAL testout :  std_logic;
          

  BEGIN

  -- Component Instantiation
          uut: entity work.prio_encoder(cond_arch) PORT MAP(
                  r => testin0,
                  pcode => testout
          );

	PROCESS
   BEGIN
	
	testin0 <= "1111";
	wait for 2ns;
	
	testin0 <= "0000";
	wait for 2ns;
	
	assert false
	report "Simulation Completed"
	severity failure;

   END PROCESS tb;
  --  End Test Bench 

  END;
