library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_hex_bcd_decoder is
end entity tb_hex_bcd_decoder;

architecture sim of tb_hex_bcd_decoder is

  component hex_bcd_decoder is
    port (
      i_hex  : in  std_logic_vector(3 downto 0);
      o_bcd1 : out std_logic_vector(3 downto 0);
      o_bcd2 : out std_logic_vector(3 downto 0)
    );
  end component;

  signal hex  : std_logic_vector(3 downto 0) := (others => '0');
  signal bcd1 : std_logic_vector(3 downto 0);   -- tens
  signal bcd2 : std_logic_vector(3 downto 0);   -- ones

begin

  dut : hex_bcd_decoder
    port map (i_hex => hex, o_bcd1 => bcd1, o_bcd2 => bcd2);

  stim : process
  begin
    for i in 0 to 15 loop
      hex <= std_logic_vector(to_unsigned(i, 4));
      wait for 10 ns;
    end loop;
    wait;
  end process stim;

end architecture sim;
