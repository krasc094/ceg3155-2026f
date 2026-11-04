library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_adder4 is
end entity tb_adder4;

architecture sim of tb_adder4 is

  component adder4 is
    port (
      i_a    : in  std_logic_vector(3 downto 0);
      i_b    : in  std_logic_vector(3 downto 0);
      i_cin  : in  std_logic;
      o_sum  : out std_logic_vector(3 downto 0);
      o_cout : out std_logic
    );
  end component;

  signal a, b : std_logic_vector(3 downto 0) := (others => '0');
  signal cin  : std_logic := '0';
  signal sum  : std_logic_vector(3 downto 0);
  signal cout : std_logic;

begin

  dut : adder4
    port map (i_a => a, i_b => b, i_cin => cin, o_sum => sum, o_cout => cout);

  stim : process
  begin
    for c in 0 to 1 loop
      for x in 0 to 15 loop
        for y in 0 to 15 loop
          a <= std_logic_vector(to_unsigned(x, 4));
          b <= std_logic_vector(to_unsigned(y, 4));
          if c = 1 then
            cin <= '1';
          else
            cin <= '0';
          end if;
          wait for 5 ns;
        end loop;
      end loop;
    end loop;
    wait;
  end process stim;

end architecture sim;
