library ieee;
use ieee.std_logic_1164.all;
entity carryLookaheadUnit_16bit is
  port(
  i_g : in std_logic_vector(3 downto 0);
  i_p : in std_logic_vector(3 downto 0);
  i_c0 : in std_logic;
  
  o_carry : out std_logic_vector(3 downto 0)
);
end carryLookaheadUnit_16bit;

architecture structural of carryLookaheadUnit_16bit is

signal int_carry : std_logic_vector(4 downto 0);

-- propagates
  alias p0 is i_p(0); alias p1 is i_p(1);
  alias p2 is i_p(2); alias p3 is i_p(3);
-- generates
  alias g0 is i_g(0); alias g1 is i_g(1);
  alias g2 is i_g(2); alias g3 is i_g(3);
begin

int_carry(0) <= i_c0;
int_carry(1) <= g0 
                or (p0 and i_c0);
int_carry(2) <= g1 
                or (p1 and g0) 
                or (p1 and p0 and i_c0);
int_carry(3) <= g2 
                or (p2 and g1) 
                or (p2 and p1 and g0) 
                or (p2 and p1 and p0 and i_c0);
int_carry(4) <= g3 
                or (p3 and g2) 
                or (p3 and p2 and g1) 
                or (p3 and p2 and p1 and g0) 
                or (p3 and p2 and p1 and p0 and i_c0);

o_carry <= int_carry(4 downto 1);

end architecture;
