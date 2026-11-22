library ieee;
use ieee.std_logic_1164.all;
entity lab4_topLevel is
  port (
    GClock : in std_logic; 
    GReset: in std_logic; 
    KbClock: in std_logic; 
    KbInfo: in std_logic; 

    BCD1 : out std_logic_vector(3 downto 0);
    BCD2 : out std_logic_vector(3 downto 0)
  );
end lab4_topLevel;

architecture structural of lab4_topLevel is


begin


end architecture;
