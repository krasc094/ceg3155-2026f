library ieee;
use ieee.std_logic_1164.all;
entity carryLookahead_4bit is
  port (
    i_propogate : in std_logic_vector(3 downto 0);
    i_generate : in std_logic_vector(3 downto 0);
    i_carry : in std_logic;

    o_superPropagate : out std_logic;
    o_superGenerate : out std_logic;

    o_carry : out std_logic_vector(3 downto 0)
  );
end carryLookahead_4bit;

architecture structural of carryLookahead_4bit is
component claFullAdder_1bit is
  port (
    i_a : in std_logic;
    i_b : in std_logic;
    i_carry : in std_logic;

    o_sum : out std_logic;
    o_generate: out std_logic;
    o_propagate: out std_logic
  );
end component;

signal int_p : std_logic_vector(3 downto 0);
signal int_g : std_logic_vector(3 downto 0);
signal int_carry_in : std_logic_vector(3 downto 0);

  alias p0 is int_p(0);
  alias p1 is int_p(1);
  alias p2 is int_p(2);
  alias p3 is int_p(3);

  alias g0 is int_g(0);
  alias g1 is int_g(1);
  alias g2 is int_g(2);
  alias g3 is int_g(3);
begin
  o_superPropagate <= p3 and p2 and p1 and p0;
  o_superGenerate <= g3 
    or (p3 and g2)
    or (p3 and p2 and g1)
    or (p3 and p2 and p1 and g0);


end architecture;
