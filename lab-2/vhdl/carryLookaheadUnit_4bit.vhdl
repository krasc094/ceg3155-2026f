library ieee;
use ieee.std_logic_1164.all;
entity carryLookaheadUnit_4bit is
  port (
    i_a : in std_logic_vector(3 downto 0);
    i_b : in std_logic_vector(3 downto 0);
    i_carry : in std_logic;
    o_carry : out std_logic_vector(4 downto 1);

    o_superPropagate : out std_logic;
    o_superGenerate : out std_logic

  );
end carryLookaheadUnit_4bit;

architecture structural of carryLookaheadUnit_4bit is
signal int_p : std_logic_vector(3 downto 0);
signal int_g : std_logic_vector(3 downto 0);
signal int_carry : std_logic_vector(4 downto 0);

-- makes it easier to read
-- propagates
  alias p0 is int_p(0); alias p1 is int_p(1);
  alias p2 is int_p(2); alias p3 is int_p(3);
-- generates
  alias g0 is int_g(0); alias g1 is int_g(1);
  alias g2 is int_g(2); alias g3 is int_g(3);
begin

  o_superPropagate <= p3 and p2 and p1 and p0;
  o_superGenerate <= g3 
    or (p3 and g2)
    or (p3 and p2 and g1)
    or (p3 and p2 and p1 and g0);

  lookahead: for i in 3 downto 0 generate
  begin
    int_g(i) <= i_a(i) and i_b(i);
    int_p(i) <= i_a(i) or i_b(i);
  end generate;

  int_carry(0) <= i_carry;
  carry: for i in 4 downto 1 generate
  begin
    int_carry(i) <= int_g(i-1) or (int_p(i-1) and int_carry(i-1));
  end generate;

  o_carry <= int_carry(4 downto 1);

end architecture;
