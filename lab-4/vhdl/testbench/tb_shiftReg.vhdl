-- ==== SHIFT REGISTER TEST BENCH
library ieee;
use ieee.std_logic_1164.all;
entity tb_shiftRegister is
  generic ( n : integer := 4 );
  end tb_shiftRegister;

architecture testbench of tb_shiftRegister is 
  signal clock_tb : std_logic := '0';
  signal d_tb, o_tb: std_logic_vector(n-1 downto 0) := (others => '0');
  signal load_TB, shiftL_TB, shiftR_TB, shiftExtension_TB: std_logic := '0'; 
  signal sim_end : BOOLEAN := false;
  constant CLOCK_PERIOD : time := 20 ns;

  component shiftRegister is   
    generic ( n : integer := 4 );
    port ( 
    i_clock, i_reset_low : in std_logic;
    i_load, i_shiftL, i_shiftR : in std_logic;
    i_shiftExtension : in std_logic;

    i_d : in std_logic_vector(n-1 downto 0);
    o_q : out std_logic_vector(n-1 downto 0)
  );
  end component;
begin
  dut: shiftRegister
  port map (
    i_clock => clock_tb,
    i_load => load_TB,
    i_shiftL => shiftL_tb,
    i_shiftR => shiftR_tb,
    i_shiftExtension => shiftExtension_tb,
    
    i_d => d_tb,
    o_q => o_tb,

    i_reset_low => '1'
  );
  
  clock_process:
  process begin
    while (not sim_end) loop
      clock_tb <= '1';
      wait for clock_period / 2;
      clock_tb <= '0';
      wait for clock_period / 2;
    end loop;
    wait;
  end process clock_process;

  stimulus: 
  process begin
    wait for clock_period / 2;
    d_tb <= "0010"; load_TB <= '1';
    wait for clock_period / 2; -- clock rising edge
    load_TB <= '0';
    wait for clock_period / 2; -- falling 
    assert o_tb = "0010" report "load failed";

    shiftL_TB <= '1'; shiftExtension_TB <= '1';
    wait for clock_period / 2; -- rising
    shiftL_TB <= '0'; shiftExtension_TB <= '0';
    wait for clock_period / 2; -- rising
    assert o_tb = "0101" report "shift failed"; 

    wait for clock_period / 2;
    sim_end <= true;
    wait;
  end process stimulus;
end testbench;
