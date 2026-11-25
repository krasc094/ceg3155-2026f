library ieee;
use ieee.std_logic_1164.all;

-- Piece 1: the entity
entity clockFilter_100Mhz is
    port (
        i_clk_100mhz : in std_logic;   -- 100 MHz global clock
        i_kbClk : in  std_logic;   -- raw keyboard clock (HC)
        i_resetBar : in std_logic;   -- global reset, active low
        o_clkFiltered : out std_logic    -- filtered clock
    );
end entity clockFilter_100Mhz;

architecture rtl of clockFilter_100Mhz is

  component shiftRegisterSerial is
    generic ( n : integer := 8);
    port (
      i_clock, i_reset_low : in std_logic;
      i_shift : in std_logic;
      i_d : in std_logic;
      o : out std_logic_vector(n-1 downto 0)
  );
  end component;

  component allOnes_8 is
    port (
      i_a : in std_logic_vector(7 downto 0);
      o_q : out std_logic
    );
  end component;

  component allZeroes_8 is
    port (
      i_a : in std_logic_vector(7 downto 0);
      o_q : out std_logic
    );
  end component;

  component enabledSRLatch IS
    PORT(
      i_set, i_reset : in std_logic;
      i_enable : in std_logic;
      o_q, o_qBar : out	std_logic);
  END component;
  
  signal int_allZeroes, int_allOnes : std_logic;
  signal int_last8 : std_logic_vector(7 downto 0);
  signal int_filtered : std_logic;
begin

  last8 : shiftRegisterSerial
    generic map( n => 8)
    port map(
      i_clock => i_clk_100mhz,
      i_reset_low => i_resetBar,
      i_shift => '1',
      i_d => i_kbClk,
      o => int_last8
    );

  allOnes: allOnes_8
  port map(int_last8, int_allOnes);

  allZeroes: allZeroes_8
  port map(int_last8, int_allZeroes);

  srClock: enabledSRLatch
  port map(
    i_set => int_allOnes,
    i_reset => int_allZeroes,
    i_enable => '1',
    o_q => int_filtered
  );
    
    o_clkFiltered <= int_filtered;

end architecture rtl;
