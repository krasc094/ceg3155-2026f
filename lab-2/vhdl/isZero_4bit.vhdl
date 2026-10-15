library ieee;
use ieee.std_logic_1164.all;
entity isZero_4bit is
port (
  i_in : in std_logic_vector(3 downto 0);
  o_isZero : out std_logic
);
end isZero_4bit;

architecture structural of isZero_4bit is
  alias i0 is i_in(0); 
  alias i1 is i_in(1);
  alias i2 is i_in(2); 
  alias i3 is i_in(3);
begin 
  o_isZero <= i3 or i2 or i1 or i0;
end architecture;

