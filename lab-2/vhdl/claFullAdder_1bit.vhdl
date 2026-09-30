library ieee;
use ieee.std_logic_1164.all;
entity claFullAdder_1bit is
  port (
    i_a : in std_logic;
    i_b : in std_logic;
    i_carry : in std_logic;

    o_sum : out std_logic;
    o_generate: out std_logic;
    o_propagate: out std_logic
  );
end claFullAdder_1bit;

architecture structural of claFullAdder_1bit is
begin
  o_sum <= i_a xor i_b xor i_carry;
  o_propagate <= i_a or i_b;
  o_generate <= i_a and i_b;
end architecture;
