library ieee;
use ieee.std_logic_1164.all;

entity lab4_fsm is
  port (
    i_kbInfo : in std_logic;
    i_clock, i_reset_low : in std_logic;
    i_countDone : in std_logic;

    o_state : out std_logic
  );
end entity;

architecture structural of lab4_fsm is

  component enARdFF_2 IS
      port(
        i_resetBar : in	std_logic;
        i_d : in	std_logic;
        i_enable : in	std_logic;
        i_clock : in	std_logic;
        o_q, o_qBar	: out	std_logic);
  end component;

  signal int_state, int_nextState : std_logic;
begin

  int_nextState <= (not int_state and not i_kbInfo)
                  or (int_state and not i_countDone);

  state: enARdFF_2
   port map(
      i_resetBar => i_reset_low,
      i_d => int_nextState,
      i_enable => i_clock,
      i_clock => i_clock,
      o_q => int_state
  );

  o_state <= int_state;
end architecture;
