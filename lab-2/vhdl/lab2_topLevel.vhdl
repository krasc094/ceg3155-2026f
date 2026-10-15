library ieee;
use ieee.std_logic_1164.all;
entity lab2_topLevel is
  port (
    OperandA : in std_logic_vector(3 downto 0);
    OperandB : in std_logic_vector(3 downto 0);
    GReset : in std_logic;
    GClock: in std_logic;

    ZeroOut, OverflowOut, CarryOut: out std_logic;
    MuxOut : out std_logic_vector(7 downto 0)
  );
end lab2_topLevel;

architecture structural of lab2_topLevel is

component isZero_8bit is
port (
  i_in : in std_logic_vector(7 downto 0);
  o_isZero : out std_logic
);
end component;
component lab2_multiplier is
  port (
    i_operandA : in std_logic_vector(3 downto 0);
    i_operandB : in std_logic_vector(3 downto 0);
    i_reset : in std_logic;
    i_clock: in std_logic;

    o_product : out std_logic_vector(7 downto 0);
    o_overflow : out std_logic;
    o_done : out std_logic
  );
end component;

signal int_result : std_logic_vector(7 downto 0);
signal int_clock, int_reset: std_logic;
begin

int_reset <= not GReset;
int_clock <= GClock;

zero: isZero_8bit
 port map(
    i_in => int_result,
    o_isZero => ZeroOut
);

mult: lab2_multiplier
 port map(
    i_operandA => OperandA,
    i_operandB => OperandB,
    i_reset => int_reset,
    i_clock => int_clock,
    o_product => MuxOut,
    o_overflow => OverflowOut
);
end architecture;
