-- == 4-bit CARRY LOOKAHEAD ADDER
-- deps: fullAdder_1bit, carryLookaheadUnit_4bit

library ieee;
use ieee.std_logic_1164.all;
entity carryLookaheadAdder_8bit is
  port(
  i_a : in std_logic_vector(7 downto 0);
  i_b : in std_logic_vector(7 downto 0);
  i_carryIn : in std_logic;
  
  o_carry : out std_logic;
  o_overflow : out std_logic;
  o_result : out std_logic_vector(7 downto 0)
);
end carryLookaheadAdder_8bit;

architecture structural of carryLookaheadAdder_8bit is
component carryLookaheadAdder_4bit is
  port(
  i_a : in std_logic_vector(3 downto 0);
  i_b : in std_logic_vector(3 downto 0);
  i_carryIn : in std_logic;
  
  o_carry : out std_logic;
  o_overflow : out std_logic;
  o_result : out std_logic_vector(3 downto 0);
  o_superPropagate : out std_logic;
  o_superGenerate : out std_logic
);
end component;

component carryLookaheadUnit_16bit is
  port(
  i_g : in std_logic_vector(3 downto 0);
  i_p : in std_logic_vector(3 downto 0);
  i_c0 : in std_logic;
  
  o_carry : out std_logic_vector(3 downto 0)
);
end component;

signal int_carry : std_logic_vector(4 downto 0) := "00000";
signal int_result : std_logic_vector(7 downto 0) := "00000000";

signal int_g : std_logic_vector(3 downto 0) := "0000";
signal int_p : std_logic_vector(3 downto 0) := "0000";


begin

cla: carryLookaheadUnit_16bit
 port map(
    i_g => int_g,
    i_p => int_p,
    i_c0 => i_carryIn,
    o_carry => int_carry(4 downto 1)
);

lower: carryLookaheadAdder_4bit
 port map(
    i_a => i_a(3 downto 0),
    i_b => i_b(3 downto 0),
    i_carryIn => int_carry(0),
    o_superPropagate => int_g(0),
    o_superGenerate => int_p(0),
    o_result => int_result(3 downto 0)
);

higher: carryLookaheadAdder_4bit
 port map(
    i_a => i_a(7 downto 4),
    i_b => i_b(7 downto 4),
    i_carryIn => i_carryIn,
    o_superPropagate => int_g(1),
    o_superGenerate => int_p(1),
    o_overflow => o_overflow,
    o_result => int_result(7 downto 4)
);

-- for 8-bit version specifically
o_carry <= int_carry(1);
o_result <= int_result;
end architecture;
