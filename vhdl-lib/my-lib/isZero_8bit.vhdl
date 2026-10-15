
library ieee;
use ieee.std_logic_1164.all;
entity isZero_8bit is
port (
  i_in : in std_logic_vector(7 downto 0);
  o_isZero : out std_logic
);
end isZero_8bit;

architecture structural of isZero_8bit is
  alias i0 is i_in(0); 
  alias i1 is i_in(1);
  alias i2 is i_in(2); 
  alias i3 is i_in(3);
  alias i4 is i_in(4); 
  alias i5 is i_in(5);
  alias i6 is i_in(6); 
  alias i7 is i_in(7);
begin 
-- surely there has to be a better way to do this
  o_isZero <= i7 or i6 or i5 or i4 or i3 or i2 or i1 or i0;
end architecture;

