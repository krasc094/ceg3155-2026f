library ieee;
use ieee.std_logic_1164.all;

entity tb_shiftRegisterSerial is
end entity;

architecture testbench of tb_shiftRegisterSerial is


component shiftRegisterSerial is
  generic ( n : integer := 4);
  port (
    i_clock, i_reset_low : in std_logic;
    i_shift : in std_logic;
    i_d : in std_logic;
    o : out std_logic_vector(n-1 downto 0)
);
end component;

  signal sim_end : BOOLEAN := false;
  constant CLOCK_PERIOD : time := 20 ns;

  signal clock_tb, reset_tb : std_logic := '0';
  signal shift_tb : std_logic := '0';
  signal d_tb : std_logic := '0';
  signal o_tb : std_logic_vector(8-1 downto 0) := "00000000";

begin

  dut: shiftRegisterSerial
   generic map( n => 8)
   port map(
      i_clock => clock_tb,
      i_reset_low => reset_tb,
      i_shift => shift_tb,
      i_d => d_tb,
      o => o_tb
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

    reset_tb <= '1';   

    shift_tb <= '1';   
    d_tb <= '1';   
    wait for clock_period / 2;

    d_tb <= '0';   
    wait for clock_period;

    d_tb <= '1';   
    sim_end <= true;
    wait;
  end process stimulus;


end architecture;

