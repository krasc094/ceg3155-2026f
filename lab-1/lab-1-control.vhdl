library ieee;
use ieee.std_logic_1164.all;

entity lab1_control is
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

end lab1_control;

architecture structural of lab1_control is
  signal s0in, s1in, s2in, s3in, s4in : std_logic;
  signal s0out, s1out, s2out, s3out, s4out : std_logic;

  component dff_2 is
    port(
      i_d		: in	std_logic;
      i_clock		: in	std_logic;
      o_q, o_qbar	: out	std_logic);
  end component;

begin 
  s0in <= i_reset;
  s1in <= i_left and i_right and not i_reset;
  s2in <= i_left and not i_right and not i_reset;
  s3in <= not i_left and i_right and not i_reset;
  s4in <= not i_left and not i_right and not i_reset;

  o_loadLMask <= s0out; 
  o_loadRMask <= s0out;

  o_loadDisplay <= s0out or s1out or s2out or s3out or s4out;
  o_shiftLMask <= s0out or s1out or s2out;
  o_shiftRMask <= s0out or s1out or s3out;

s0 : dff_2
port map (
      i_d => s0in,
      i_clock => i_clock,
      o_q => s0out
);

s1 : dff_2
port map (
      i_d => s1in,
      i_clock => i_clock,
      o_q => s1out
);

s2 : dff_2
port map (
      i_d => s2in,
      i_clock => i_clock,
      o_q => s2out
);

s3 : dff_2
port map (
      i_d => s3in,
      i_clock => i_clock,
      o_q => s3out
);

s4 : dff_2
port map (
      i_d => s4in,
      i_clock => i_clock,
      o_q => s4out
);

end architecture;

