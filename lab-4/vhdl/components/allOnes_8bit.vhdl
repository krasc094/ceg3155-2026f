library ieee;
use ieee.std_logic_1164.all;

entity allOnes_8 is
  port (
    i_a : in std_logic_vector(7 downto 0);
    o_q : out std_logic
  );
end allOnes_8;

architecture structural of allOnes_8 is
begin
  o_q <= i_a(0) and i_a(1) and i_a(2) and i_a(3) and
    i_a(4) and i_a(5) and i_a(6) and i_a(7);
end architecture;
