library ieee;
use ieee.std_logic_1164.all;

entity tb_sevenSeg is
end entity tb_sevenSeg;

architecture sim of tb_sevenSeg is

  component sevenSeg is
    port (
      i_clk      : in  std_logic;
      i_resetBar : in  std_logic;
      i_bcd1     : in  std_logic_vector(3 downto 0);
      i_bcd2     : in  std_logic_vector(3 downto 0);
      o_an       : out std_logic_vector(7 downto 0);
      o_seg      : out std_logic_vector(6 downto 0)
    );
  end component;

  signal clk      : std_logic := '0';
  signal resetbar : std_logic := '0';
  signal bcd1     : std_logic_vector(3 downto 0) := "0100";   -- 4
  signal bcd2     : std_logic_vector(3 downto 0) := "0111";   -- 7
  signal an       : std_logic_vector(7 downto 0);
  signal seg      : std_logic_vector(6 downto 0);
  signal sim_end  : std_logic := '0';

begin

  dut : sevenSeg
    port map (i_clk => clk, i_resetBar => resetbar, i_bcd1 => bcd1, i_bcd2 => bcd2,
              o_an => an, o_seg => seg);

  clk <= not clk after 5 ns when sim_end = '0' else '0';

  stim : process
  begin
    resetbar <= '0';  wait for 20 ns;                    -- reset
    resetbar <= '1';  wait for 80 ns;                    -- shows 47
    bcd1 <= "0001";  bcd2 <= "0101";  wait for 80 ns;    -- shows 15
    sim_end <= '1';
    wait;
  end process stim;

end architecture sim;
