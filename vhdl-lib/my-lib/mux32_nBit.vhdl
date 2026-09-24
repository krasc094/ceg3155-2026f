-- ==== 32 INPUT N-BIT MUX
-- deps: mux8_nBit
library ieee;
use ieee.std_logic_1164.all;
entity mux32_nBit is
generic (bit_width : integer := 8);
port (
  i_1, i_2, i_3, i_4,
  i_5, i_6, i_7, i_8,
  i_9, i_10, i_11, i_12,
  i_13, i_14, i_15, i_16,
  i_17, i_18, i_19, i_20,
  i_21, i_22, i_23, i_24,
  i_25, i_26, i_27, i_28,
  i_29, i_30, i_31, i_32 : in std_logic_vector(bit_width-1 downto 0);
  sel : in std_logic_vector(5 downto 0);
  o : out std_logic_vector(bit_width-1 downto 0)
);
end mux32_nBit;

architecture rtl of mux32_nBit is
  signal int_m1, int_m2, int_m3, int_m4,
        int_m5, int_m6, int_m7, int_m8 : std_logic_vector(bit_width-1 downto 0);
  component mux8_nBit is
    generic (bit_width : integer := 8);
    port (
      i_1, i_2, i_3, i_4,
      i_5, i_6, i_7, i_8 : in std_logic_vector(bit_width-1 downto 0);
      sel : in std_logic_vector(2 downto 0);
      o : out std_logic_vector(bit_width-1 downto 0)
    );
  end component;
begin
  m1: mux8_nBit
  generic map ( bit_width => bit_width )
  port map (
    sel => sel(2 downto 0),
    i_1 => i_1,
    i_2 => i_2,
    i_3 => i_3,
    i_4 => i_4,
    i_5 => i_5,
    i_6 => i_6,
    i_7 => i_7,
    i_8 => i_8,
    o => int_m1
  );


  m2: mux8_nBit
  generic map ( bit_width => bit_width )
  port map (
    sel => sel(2 downto 0),
    i_1 => i_9,
    i_2 => i_10,
    i_3 => i_11,
    i_4 => i_12,
    i_5 => i_13,
    i_6 => i_14,
    i_7 => i_15,
    i_8 => i_16,
    o => int_m2
  );


  m3: mux8_nBit
  generic map ( bit_width => bit_width )
  port map (
    sel => sel(2 downto 0),
    i_1 => i_17,
    i_2 => i_18,
    i_3 => i_19,
    i_4 => i_20,
    i_5 => i_21,
    i_6 => i_22,
    i_7 => i_23,
    i_8 => i_24,
    o => int_m3
  );
    
  m4: mux8_nBit
  generic map ( bit_width => bit_width )
  port map (
    sel => sel(2 downto 0),
    i_1 => i_25,
    i_2 => i_26,
    i_3 => i_27,
    i_4 => i_28,
    i_5 => i_29,
    i_6 => i_30,
    i_7 => i_31,
    i_8 => i_32,
    o => int_m4
  );

  mOut: mux8_nBit
  generic map ( bit_width => bit_width )
  port map (
    sel => sel(5 downto 3),
    i_1 => int_m1,
    i_2 => int_m2,
    i_3 => int_m3,
    i_4 => int_m4,
    i_5 => int_m5,
    i_6 => int_m6,
    i_7 => int_m7,
    i_8 => int_m8,
    o => o
  );
end rtl;
