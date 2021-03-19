LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;

use work.common_defs.all;
 
ENTITY system_tb IS
END system_tb;
 
ARCHITECTURE behavior OF system_tb IS 
 
   -- Component ports
  signal reset          : std_logic;
  signal pulse    	: std_logic;
 
   -- Clock
  signal clk : std_logic := '1';

  -- Variables
  shared variable end_run : boolean := false;

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: entity work.system PORT MAP (
          clk => clk,
          reset => reset,
          pulse => pulse
        );

  
 -- Clock generation
  clk_proc : process
  begin
    while end_run = false loop
      clk <= not clk;
      wait for 5 ns;
    end loop;

    wait;
  end process clk_proc;

   -- Stimulus process
   stim_proc: process
   begin		
      	wait until clk = '1';
    	wait for 2 ns;

    	reset <= '1';
    	wait for 10 ns;
    	reset <= '0';
    	
    --wait for 999 ns;
		 
    --end_run := true;

      wait;
   end process;

END;
