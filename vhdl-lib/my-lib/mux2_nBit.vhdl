-- ==== 2 INPUT N-BIT MUX
-- deps: none
library ieee;
use ieee.std_logic_1164.all;
entity mux2_nBit is
generic (bit_width : integer := 8);
port (
  i_1, i_2 : in std_logic_vector(bit_width-1 downto 0);
  sel : in std_logic;
  o : out std_logic_vector(bit_width-1 downto 0)
);
end mux2_nBit;

architecture rtl of mux2_nBit is
begin
  b_i: for i in bit_width-1 downto 0 generate
  begin
    o(i) <= 
      (i_1(i) and not sel) or
      (i_2(i) and sel);
  end generate;
end rtl;
