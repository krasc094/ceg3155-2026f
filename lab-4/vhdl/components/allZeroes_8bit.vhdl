library ieee;
use ieee.std_logic_1164.all;

entity allZeroes_8 is
  port (
    i_a : in std_logic_vector(7 downto 0);
    o_q : out std_logic
  );
end allZeroes_8;

architecture structural of allZeroes_8 is
begin
  o_q <= (not i_a(0)) and (not i_a(1)) and (not i_a(2)) and (not i_a(3)) and
        (not i_a(4)) and (not i_a(5)) and (not i_a(6)) and (not i_a(7));
end architecture;
