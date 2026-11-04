library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_comparator4 is
end entity tb_comparator4;

architecture sim of tb_comparator4 is

  component comparator4 is
    port (
      i_a, i_b : in  std_logic_vector(3 downto 0);
      o_gt     : out std_logic;
      o_lt     : out std_logic;
      o_gteq   : out std_logic
    );
  end component;

  signal a, b   : std_logic_vector(3 downto 0) := (others => '0');
  signal gt, lt : std_logic;
  signal gteq   : std_logic;

begin

  dut : comparator4
    port map (i_a => a, i_b => b, o_gt => gt, o_lt => lt, o_gteq => gteq);

  stim : process
  begin
    for x in 0 to 15 loop
      for y in 0 to 15 loop
        a <= std_logic_vector(to_unsigned(x, 4));
        b <= std_logic_vector(to_unsigned(y, 4));
        wait for 5 ns;
      end loop;
    end loop;
    wait;
  end process stim;

end architecture sim;
