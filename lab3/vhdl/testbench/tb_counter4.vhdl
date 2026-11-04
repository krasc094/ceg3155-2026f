library ieee;
use ieee.std_logic_1164.all;

entity tb_counter4 is
end entity tb_counter4;

architecture sim of tb_counter4 is

  component counter4 is
    port (
      i_clock    : in  std_logic;
      i_resetBar : in  std_logic;
      i_enable   : in  std_logic;
      o_count    : out std_logic_vector(3 downto 0)
    );
  end component;

  signal clk      : std_logic := '0';
  signal resetbar : std_logic := '0';
  signal enable   : std_logic := '0';
  signal count    : std_logic_vector(3 downto 0);
  signal sim_end  : std_logic := '0';

begin

  dut : counter4
    port map (i_clock => clk, i_resetBar => resetbar, i_enable => enable, o_count => count);

  clk <= not clk after 5 ns when sim_end = '0' else '0';

  stim : process
  begin
    resetbar <= '0';  enable <= '1';  wait for 20 ns;   -- reset
    resetbar <= '1';                  wait for 200 ns;  -- count past 15
    enable <= '0';                    wait for 50 ns;   -- hold
    enable <= '1';                    wait for 30 ns;   -- count again
    resetbar <= '0';                  wait for 20 ns;   -- reset
    sim_end <= '1';
    wait;
  end process stim;

end architecture sim;
