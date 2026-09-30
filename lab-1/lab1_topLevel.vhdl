library ieee;
use ieee.std_logic_1164.all;
entity lab1_topLevel is
  port (
    GClock : in std_logic;
    GReset : in std_logic;
    Left : in std_logic;
    Right : in std_logic;
    DisplayOut: out std_logic_vector(7 downto 0)
  );
end lab1_topLevel;

architecture structural of lab1_topLevel is

component shiftRegister is
  generic ( n : integer := 4 );
  port ( 
  clock, reset : in std_logic;
  load, shiftL, shiftR : in std_logic;
  shiftExtension : in std_logic;

  d : in std_logic_vector(n-1 downto 0);
  o : out std_logic_vector(n-1 downto 0)
);
end component;

component mux4_nBit is
generic (bit_width : integer := 8);
port (
  i_1, i_2, i_3, i_4 : in std_logic_vector(bit_width-1 downto 0);
  sel : in std_logic_vector(1 downto 0);
  o : out std_logic_vector(bit_width-1 downto 0)
);
end component;


component lab1_control is
  port (
    i_clock: in std_logic;
    i_reset: in std_logic;
    i_left : in std_logic;
    i_right : in std_logic;
  
    o_loadDisplay : out std_logic;
    o_loadLMask: out std_logic;
    o_loadRMask : out std_logic;
    o_shiftLMask: out std_logic;
    o_shiftRMask : out std_logic
  );

end component;

signal zero : std_logic;
signal zero_8bit : std_logic_vector(7 downto 0);

signal int_loadDisplay, int_loadLMask, int_loadRMask : std_logic;
signal int_shiftRmask, int_shiftLmask : std_logic;

signal int_displayIn, int_rmaskIn, int_lmaskIn : std_logic_vector(7 downto 0);
signal int_displayOut, int_rmaskOut, int_lmaskOut, int_bothOut : std_logic_vector(7 downto 0);

signal int_muxSel : std_logic_vector(1 downto 0);

begin

zero <= '0';
zero_8bit <= "00000000";

int_bothOut <= int_lmaskOut or int_rmaskOut;
int_muxSel(0) <= Right;
int_muxSel(1) <= Left;

int_lmaskIn <= "00000001";
int_rmaskIn <= "10000000";

control : lab1_control
 port map(
    i_clock => GClock,
    i_reset => GReset,
    i_left => Left,
    i_right => Right,
    o_loadDisplay => int_loadDisplay,
    o_loadLMask => int_loadLMask,
    o_loadRMask => int_loadRMask,
    o_shiftLMask => int_shiftLmask,
    o_shiftRMask => int_shiftRmask
);

mux : mux4_nBit
 generic map( bit_width => 8)
 port map(
    i_1 => zero_8bit,
    i_2 => int_rmaskOut,
    i_3 => int_lmaskOut,
    i_4 => int_bothOut,
    sel => int_muxSel,
    o => int_displayIn
);

displayReg : shiftRegister
 generic map( n => 8 )
 port map(
    clock => GClock,
    reset => GReset,
    load => int_loadDisplay,
    shiftL => zero,
    shiftR => zero,
    shiftExtension => zero,
    d => int_displayIn,
    o => int_displayOut
);

lMaskReg : shiftRegister
 generic map( n =>  8 )
 port map(
    clock => GClock,
    reset => GReset,
    load => int_loadLMask,
    shiftL => int_shiftLmask,
    shiftR => zero,
    shiftExtension => zero,
    d => int_lmaskIn,
    o => int_lmaskOut
);

rMaskReg : shiftRegister
 generic map( n => 8 )
 port map(
    clock => GClock,
    reset => GReset,
    load => int_loadRMask,
    shiftL => zero,
    shiftR => int_shiftRmask,
    shiftExtension => zero,
    d => int_rmaskIn,
    o => int_rmaskOut
);

end architecture;
