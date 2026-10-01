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

component clk_div IS
	port (
		clock_25mhz				: in	std_logic;
		clock_1mhz				: out	std_logic;
		clock_100khz				: out	std_logic;
		clock_10khz				: out	std_logic;
		clock_1khz				: out	std_logic;
		clock_100hz				: out	std_logic;
		clock_10hz				: out	std_logic;
		clock_1hz				: out	std_logic);
	
end component;

signal zero : std_logic;
signal zero_8bit : std_logic_vector(7 downto 0);

signal int_loadDisplay, int_loadLMask, int_loadRMask : std_logic;
signal int_shiftRmask, int_shiftLmask : std_logic;

signal int_displayIn, int_rmaskIn, int_lmaskIn : std_logic_vector(7 downto 0);
signal int_displayOut, int_rmaskOut, int_lmaskOut, int_bothOut : std_logic_vector(7 downto 0);

signal int_muxSel : std_logic_vector(1 downto 0);
signal int_clock : std_logic;

begin

zero <= '0';
zero_8bit <= "00000000";

int_bothOut <= int_lmaskOut or int_rmaskOut;
int_muxSel(0) <= Right;
int_muxSel(1) <= Left;

int_lmaskIn <= "00000001";
int_rmaskIn <= "10000000";

clock_div: clk_div 
	port map (
		clock_25mhz => GClock,
		clock_1hz => int_clock	
  );

control : lab1_control
 port map(
    i_clock => int_clock,
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
    clock => int_clock,
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
    clock => int_clock,
    reset => GReset,
    load => int_loadLMask,
    shiftL => int_shiftLmask,
    shiftR => zero,
    shiftExtension => int_lmaskOut(7),
    d => int_lmaskIn,
    o => int_lmaskOut
);

rMaskReg : shiftRegister
 generic map( n => 8 )
 port map(
    clock => int_clock,
    reset => GReset,
    load => int_loadRMask,
    shiftL => zero,
    shiftR => int_shiftRmask,
    shiftExtension => int_rmaskOut(0),
    d => int_rmaskIn,
    o => int_rmaskOut
);

end architecture;

entity lab1_topLevel_TB is
end lab1_topLevel_TB;

library ieee;
use ieee.std_logic_1164.all;
architecture structural of lab1_topLevel_TB is
component lab1_topLevel is
  port (
    GClock : in std_logic;
    GReset : in std_logic;
    Left : in std_logic;
    Right : in std_logic;
    DisplayOut: out std_logic_vector(7 downto 0)
  );
end component;

    signal clock_tb, reset_tb, left_tb, right_tb : std_logic;
    signal display_out_tb: std_logic_vector(7 downto 0);
    signal sim_end: std_logic;
    constant CLOCK_PERIOD : time := 20 ns;

begin 
dut: lab1_topLevel
 port map(
    GClock => clock_tb,
    GReset => reset_tb,
    Left => left_tb,
    Right => right_tb,
    DisplayOut => display_out_tb
);

  clock_process:
  process begin
    while (not sim_end) loop
      clock_tb <= '1';
      wait for clock_period / 2;
      clock_tb <= '0';
      wait for clock_period / 2;
    end loop;
    wait;
  end process clock_process;
end architecture;
