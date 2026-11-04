library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity hex_bcd_decoder is
    port (
        i_hex  : in  std_logic_vector(3 downto 0);
        o_bcd1 : out std_logic_vector(3 downto 0);  -- tens (left)
        o_bcd2 : out std_logic_vector(3 downto 0)   -- ones (right)
    );
end entity hex_bcd_decoder;

architecture structural of hex_bcd_decoder is
begin
    -- tens: 1 for 10 to 15
    o_bcd1(3 downto 1) <= "000";
    o_bcd1(0) <= (i_hex(3) and i_hex(2)) or (i_hex(3) and i_hex(1));

    -- ones
    o_bcd2(3) <= i_hex(3) and not i_hex(2) and not i_hex(1);                        
    o_bcd2(2) <= (not i_hex(3) and i_hex(2)) or (i_hex(2) and i_hex(1));           
    o_bcd2(1) <= (not i_hex(3) and i_hex(1)) or (i_hex(3) and i_hex(2) and not i_hex(1)); 
    o_bcd2(0) <= i_hex(0);                                                          
end architecture structural;