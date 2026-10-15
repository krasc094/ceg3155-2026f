library ieee;
use ieee.std_logic_1164.all;

entity mulControl is
  port (
    i_multiplicand : in std_logic_vector(7 downto 0);
    i_multiplier : in std_logic_vector(3 downto 0);
    i_clock, i_reset :in  std_logic;

    o_loadMultiplicand, o_shlMultiplicand, 
    o_loadMultiplier, o_shrMultiplier, 
    o_loadProduct, o_productSelect,
    o_done : out std_logic
);
end mulControl;

architecture structural of mulControl is
  component dFF_2 is
    port(
      i_d		: in	std_logic;
      i_clock		: in	std_logic;
      o_q, o_qbar	: out	std_logic);
  end component;

  component isZero_8bit is
  port (
    i_in : in std_logic_vector(7 downto 0);
    o_isZero : out std_logic
  );
  end component;

component isZero_4bit is
port (
  i_in : in std_logic_vector(3 downto 0);
  o_isZero : out std_logic
);
end component;

  signal S, d : std_logic_vector(3 downto 0);
  signal s0in, s1in, s2in, s3in, s4in : std_logic;
  signal s0out, s1out, s2out, s3out, s4out : std_logic;

  signal int_multiplierLsbIsZero : std_logic;
  signal int_z1, int_z2, int_bothZero : std_logic;

  alias multiplierLSB is i_multiplier(0);
begin

z1: isZero_8bit
 port map(
    i_in => i_multiplicand,
    o_isZero => int_z1
);

z2: isZero_4bit
 port map(
    i_in => i_multiplier,
    o_isZero => int_z2
);

int_bothZero <= int_z1 and int_z2;
int_multiplierLsbIsZero <= not multiplierLSB;

  -- next-state equations
  s0in <= i_reset;
  s1in <= not i_reset and (
          (S0out and int_multiplierLsbIsZero and not int_bothZero)
          or (S2out and int_multiplierLsbIsZero and not int_bothZero));
  s2in <= not i_reset and (
          s1out
          or ((s0out or s2out) and (int_multiplierLsbIsZero and not int_bothZero)));
  s3in <= not i_reset and (
          (s2out or s0out) and (int_multiplierLsbIsZero and int_bothZero)
);

  s0 : dFF_2
  port map (
        i_d => s0in,
        i_clock => i_clock,
        o_q => s0out
  );
  s1 : dFF_2
  port map (
        i_d => s1in,
        i_clock => i_clock,
        o_q => s1out
  );
  s2 : dFF_2
  port map (
        i_d => s2in,
        i_clock => i_clock,
        o_q => s2out
  );
  s3 : dFF_2
  port map (
        i_d => s3in,
        i_clock => i_clock,
        o_q => s3out
  );

  -- output equations
  o_loadMultiplicand <= S0out;
  o_shlMultiplicand <= S2out;
  o_loadMultiplier <= S0out;
  o_shrMultiplier <= S2out;
  o_loadProduct <= not s3out and (S0out or (S1out and int_multiplierLsbIsZero));
  o_productSelect <= S1out;
  o_done <= S3out;

end structural;
