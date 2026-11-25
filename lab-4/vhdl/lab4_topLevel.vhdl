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
  component hex_bcd_decoder is
      port (
          i_hex  : in  std_logic_vector(3 downto 0);
          o_bcd1 : out std_logic_vector(3 downto 0);  -- tens (left)
          o_bcd2 : out std_logic_vector(3 downto 0)   -- ones (right)
      );
  end component;

  component clockFilter_100Mhz is
    port (
      i_clk_100mhz : in std_logic;
      i_kbClk : in  std_logic;
      i_resetBar : in std_logic;
      o_clkFiltered : out std_logic
    );
end component;

  component counter4 is
    port (
      i_clock    : in  std_logic;
      i_resetBar : in  std_logic;   
      i_enable   : in  std_logic;
      o_count    : out std_logic_vector(3 downto 0)
    );
  end component;

  component comparator4 is
    port (
      i_a, i_b : in  std_logic_vector(3 downto 0);
      o_gt     : out std_logic;
      o_lt     : out std_logic;   
      o_gteq   : out std_logic    
    );
  end component;

  component shiftRegister is
    generic ( n : integer := 4 );
    port ( 
    i_clock, i_reset_low : in std_logic;
    i_load, i_shiftL, i_shiftR : in std_logic;
    i_shiftExtension : in std_logic;

    i_d : in std_logic_vector(n-1 downto 0);
    o_q : out std_logic_vector(n-1 downto 0)
  );
  end component;

  component shiftRegisterSerial is
    generic ( n : integer := 4 );
    port (
      i_clock, i_reset_low : in std_logic;
      i_shift : in std_logic;
      i_d : in std_logic;
      o : out std_logic_vector(n-1 downto 0)
  );
  end component;

  component lab4_fsm is
    port (
      i_kbInfo : in std_logic;
      i_clock, i_reset_low : in std_logic;
      i_countDone : in std_logic;

      o_state : out std_logic
    );
  end component;
  
  signal int_filteredClock, int_reset, int_resetLow : std_logic;
  
  signal int_fsmState : std_logic;
  signal int_countDone : std_logic;

  signal int_displayIn : std_logic_vector(7 downto 0); 

  signal int_loadDisplay : std_logic;
  signal int_shift : std_logic;  
  signal int_count : std_logic_vector(3 downto 0);
  signal int_enableCounter : std_logic;
  signal int_resetCounter : std_logic;

  signal nine : std_logic_vector(3 downto 0) := "1001";

  signal int_toBCD : std_logic_vector(3 downto 0);
begin
-- ==== ARCHITECTURE START

int_reset <= GReset;
int_resetLow <= not GReset;
nine <= "1001";

filter: clockFilter_100Mhz
  port map(
    i_clk_100mhz => GClock,
    i_kbClk => KbClock,
    i_resetBar => int_resetLow,
    o_clkFiltered => int_filteredClock
  );

counter : counter4
  port map(
    i_clock => int_filteredClock,
    i_resetBar => int_resetCounter,
    i_enable => int_enableCounter,
    o_count => int_count
  );

isCountDone: comparator4
  port map(
    i_a => int_count,
    i_b => nine,
    o_gteq => int_countDone
  );

fsm: lab4_fsm
  port map(
    i_kbInfo => KbInfo,
    i_clock => int_filteredClock,
    i_reset_low => int_resetLow,
    i_countDone => int_countDone,
    o_state => int_fsmState
  );

reg: shiftRegisterSerial
 generic map( n => 8 )
 port map(
    i_clock => int_filteredClock,
    i_reset_low => int_resetLow,
    i_shift => int_shift,
    i_d => KbInfo,
    o => int_displayIn
);

displayReg: shiftRegister
 generic map( n => 8 )
 port map(
    i_clock => int_filteredClock,
    i_reset_low => int_resetLow,
    i_load => int_loadDisplay,
    i_shiftL => '0',
    i_shiftR => '0',
    i_shiftExtension => '0',
    i_d => int_displayIn,
    o_q => int_toBCD
);

int_shift <= int_fsmState;
int_loadDisplay <= not int_fsmState;
int_enableCounter <= int_fsmState;
int_resetCounter <= int_fsmState; -- counter's reset is low

bcd: hex_bcd_decoder
  port map(
    i_hex => int_toBCD,
    o_bcd1 => BCD1,
    o_bcd2 => BCD2
  );


end architecture;
