library ieee;
use ieee.std_logic_1164.all;
entity lab2_multiplier is
  port (
    i_operandA : in std_logic_vector(3 downto 0);
    i_operandB : in std_logic_vector(3 downto 0);
    i_reset : in std_logic;
    i_clock: in std_logic;

    o_product : out std_logic_vector(7 downto 0);
    o_overflow : out std_logic;
    o_done : out std_logic
  );
end lab2_multiplier;

architecture structural of lab2_multiplier is

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

component carryLookaheadAdder_8bit is
  port(
  i_a : in std_logic_vector(7 downto 0);
  i_b : in std_logic_vector(7 downto 0);
  i_carryIn : in std_logic;
  
  o_carry : out std_logic;
  o_overflow : out std_logic;
  o_result : out std_logic_vector(7 downto 0)
);
end component;

component mulControl is
  port (
    i_multiplicand : in std_logic_vector(7 downto 0);
    i_multiplier : in std_logic_vector(3 downto 0);
    i_clock, i_reset :in  std_logic;

    o_loadMultiplicand, o_shlMultiplicand, 
    o_loadMultiplier, o_shrMultiplier, 
    o_loadProduct, o_productSelect,
    o_done : out std_logic
);
end component;

  signal int_multiplicandOut : std_logic_vector(7 downto 0);
  signal int_multiplierOut : std_logic_vector(3 downto 0);

  signal int_loadMultiplicand : std_logic;
  signal int_shlMultiplicand : std_logic;
  signal int_shrMultiplier : std_logic;
  signal int_loadMultiplier : std_logic;

  signal int_loadProduct : std_logic;

  signal int_multiplicandIn : std_logic_vector(7 downto 0) := "00000000";
  signal int_adderOut : std_logic_vector(7 downto 0) := "00000000";
  signal int_productOut : std_logic_vector(7 downto 0) := "00000000";

  signal zero : std_logic;

begin

int_multiplicandIn(3 downto 0) <= i_operandA;
zero <= '0';

control : mulControl
 port map(
    i_multiplicand => int_multiplicandOut,
    i_multiplier => int_multiplierOut,
    i_clock => i_clock,
    i_reset => i_reset,
    o_loadProduct => int_loadProduct,
    o_loadMultiplicand => int_loadMultiplicand,
    o_shlMultiplicand => int_shlMultiplicand,
    o_loadMultiplier => int_loadMultiplier,
    o_shrMultiplier => int_shrMultiplier,
    o_done => o_done
);

multiplicand : shiftRegister
  generic map ( n => 8 )
  port map (
  d => int_multiplicandIn,
  reset => i_reset,
  clock => i_clock,
  load => int_loadMultiplicand,
  shiftL => int_shlMultiplicand,
  shiftR => zero,
  shiftExtension => zero,
  o => int_multiplicandOut
);

multiplier : shiftRegister
  generic map ( n => 4 )
port map (
  d => i_operandB,
  reset => i_reset,
  clock => i_clock,
  load => int_loadMultiplier,
  shiftL => zero,
  shiftR => int_shrMultiplier,
  shiftExtension => zero,
  o => int_multiplierOut
);

product : shiftRegister
  generic map ( n => 8 )
port map (
  d => int_adderOut,
  reset => i_reset,
  clock => i_clock,
  load => int_loadProduct,
  shiftL => zero,
  shiftR => zero,
  shiftExtension => zero,
  o => int_productOut
);

adder : carryLookaheadAdder_8bit
 port map(
    i_a => int_multiplicandOut,
    i_b => int_productOut,
    i_carryIn => zero,
    o_overflow => o_overflow,
    o_result => int_adderOut
);

o_product<= int_adderOut;

end architecture;
