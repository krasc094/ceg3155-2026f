library ieee;
use ieee.std_logic_1164.all;

entity shiftRegisterSerial is
  generic ( n : integer := 4);
  port (
    i_clock, i_reset_low : in std_logic;
    i_shift : in std_logic;
    i_d : in std_logic;
    o : out std_logic_vector(n-1 downto 0)
);
end shiftRegisterSerial;

architecture structural of shiftRegisterSerial is

component enARdff_2 is
	port(
		i_resetbar	: in	std_logic;
		i_d		: in	std_logic;
		i_enable	: in	std_logic;
		i_clock		: in	std_logic;
		o_q, o_qbar	: out	std_logic);
end component;

  signal int_d : std_logic_vector(n downto 0);
  signal int_s : std_logic_vector(n-1 downto 0);
  signal int_r : std_logic_vector(n-1 downto 0);

begin

  int_d(n) <= i_d;

  bits: for i in n-1 downto 0 generate begin
    int_s(i) <= int_d(i+1);
    int_r(i) <= not int_d(i+1);

    b_i: enARdFF_2
      port map (
        i_resetBar => i_reset_low,
        i_d => int_d(i+1),
        i_enable => i_shift,
        i_clock => i_clock,
        o_q => int_d(i)
      );
  end generate;

o <= int_d(n-1 downto 0);

end architecture;
