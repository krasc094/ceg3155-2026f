-- ==== N-BIT SHIFT REGISTER
-- last modified: 2026/11/25

-- modification history:
-- 2026/11/25 Kai R | added history and changed custom dff to enARdFF_2

-- ====
library ieee;
use ieee.std_logic_1164.all;

entity shiftRegister is
  generic ( n : integer := 4 );
  port ( 
  i_clock, i_reset_low : in std_logic;
  i_load, i_shiftL, i_shiftR : in std_logic;
  i_shiftExtension : in std_logic;

  i_d : in std_logic_vector(n-1 downto 0);
  o_q : out std_logic_vector(n-1 downto 0)
);
end shiftRegister;

architecture structural of shiftRegister is  
  signal int_d, int_q: std_logic_vector(n-1 downto 0) := (others => '0');
  signal int_sel : std_logic_vector(1 downto 0) := (others => '0');
 

  component enARdFF_2 is
      port(
        i_resetBar	: in	std_logic;
        i_d		: in	std_logic;
        i_enable	: in	std_logic;
        i_clock		: in	std_logic;
        o_q, o_qBar	: out	std_logic);
  end component;

  component mux4_1bit is
    port (
      a, b, c, d : in std_logic;
      sel : in std_logic_vector(1 downto 0);
      o : out std_logic
    ); 
  end component;
begin
 
  o_q <= int_q;  
 
  -- == MUXES have to seperate out LSB and MSB to add optional shift extension
  -- LOAD takes priority over shift
  int_sel(1) <= i_shiftL or i_load;
  int_sel(0) <= i_shiftR or i_load;

  muxes: for i in n-2 downto 1 generate
  begin
    mux_i : mux4_1bit 
    port map (
      a => int_q(i), -- hold
      b => int_q(i+1), -- shift L
      c => int_q(i-1), -- shift R
      d => i_d(i), -- load 
      sel => int_sel,
      o => int_d(i)
    );

  end generate;
  
  -- rightmost
  mux_lsb: mux4_1bit
  port map (
    a => int_q(0),
    b => int_q(1),
    c => i_shiftExtension,
    d => i_d(0), 
    sel => int_sel,
    o => int_d(0)
  );
  
  -- leftmost
  mux_msb: mux4_1bit
  port map (
    a => int_q(n-1),
    b => i_shiftExtension,
    c => int_q(n-2),
    d => i_d(n-1), 
    sel => int_sel,
    o => int_d(n-1)
  );

  bits: for i in n-1 downto 0 generate
  begin
    b_i : enARdFF_2
    port map (
      i_clock => i_clock,
      i_enable => i_clock,
      i_resetBar => i_reset_low,
      i_d => int_d(i),
      o_q => int_q(i)
    );
  end generate;

end structural;
