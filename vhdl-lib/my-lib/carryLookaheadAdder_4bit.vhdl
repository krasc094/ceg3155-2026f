-- == 4-bit CARRY LOOKAHEAD ADDER
-- deps: fullAdder_1bit, carryLookaheadUnit_4bit

library ieee;
use ieee.std_logic_1164.all;
entity carryLookaheadAdder_4bit is
  port(
  i_a : in std_logic_vector(3 downto 0);
  i_b : in std_logic_vector(3 downto 0);
  i_carryIn : in std_logic;
  
  o_carry : out std_logic;
  o_overflow : out std_logic;
  o_result : out std_logic_vector(3 downto 0)
);
end carryLookaheadAdder_4bit;

architecture structural of carryLookaheadAdder_4bit is
component fullAdder_1bit is
  port (a, b, ci : in std_logic;
  s, co : out std_logic);
end component;

component carryLookaheadUnit_4bit is
  port (
    i_a : in std_logic_vector(3 downto 0);
    i_b : in std_logic_vector(3 downto 0);
    i_carry : in std_logic;

    o_carry : out std_logic_vector(4 downto 1);

    o_superPropagate : out std_logic;
    o_superGenerate : out std_logic

  );
end component;
signal int_carry : std_logic_vector(4 downto 0) := "00000";
signal int_result : std_logic_vector(3 downto 0) := "0000";
begin

o_carry <= int_carry(4);
o_result <= int_result;

o_overflow <= int_carry(4) xor int_carry(3);

cla: carryLookaheadUnit_4bit
  port map (
  i_a => i_a,
  i_b => i_b,
  i_carry => i_carryIn,
  o_carry => int_carry(4 downto 1)
  );
int_carry(0) <= i_carryIn;

adders: for i in 3 downto 0 generate begin
  fa_i: fullAdder_1bit
  port map (
    a => i_a(i),
    b => i_b(i),
    ci => int_carry(i),
    s => int_result(i)
  );
end generate;
end architecture;

--== TESTBENCH 
library ieee;
use ieee.std_logic_1164.all;
entity cla_4bit_TB is 
  end cla_4bit_TB;

architecture testbench of cla_4bit_TB is
  signal clock_tb : std_logic := '0';
  signal a_tb, b_tb, s_tb: std_logic_vector(3 downto 0) := "0000";
  signal ci_tb, co_tb: std_logic := '0';
  signal overflow_tb: std_logic := '0';

  signal sim_end : BOOLEAN := false;
  constant CLOCK_PERIOD : time := 10 ns;

  component carryLookaheadAdder_4bit is
    port(
    i_a : in std_logic_vector(3 downto 0);
    i_b : in std_logic_vector(3 downto 0);
    i_carryIn : in std_logic;
    
    o_carry : out std_logic;
    o_overflow : out std_logic;
    o_result : out std_logic_vector(3 downto 0)
  );
  end component;
begin

dut: carryLookaheadAdder_4bit port map (
    i_a => a_tb,
    i_b => b_tb,
    i_carryIn => ci_tb,
    
    o_carry => co_tb,
    o_result => s_tb,
    o_overflow => overflow_tb
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

stimulus: process begin

  wait for clock_period;

  a_tb <= "0000"; b_tb <= "0001"; ci_tb <= '0';
  wait for clock_period;
  assert s_tb = "0001" and co_tb = '0' report "test 1 failed";

  a_tb <= "1000"; b_tb <= "1000"; ci_tb <= '0';
  wait for clock_period;
  assert s_tb = "0000" and co_tb = '1' report "test 2 failed";

  a_tb <= "1111"; b_tb <= "1111"; ci_tb <= '0';
  wait for clock_period;
  assert s_tb = "1110" and co_tb = '1' report "test 3 failed";

  -- write more test cases please :smile:
  -- overflow
  a_tb <= "1111"; b_tb <= "1111"; ci_tb <= '0';
  wait for clock_period;
  assert s_tb = "1110" and co_tb = '1' report "test 3 failed";

  sim_end <= true;
  wait;
end process stimulus;
end testbench;
