-- == PARAMETRIC BINARY COUNTER
-- desp: tFF
library ieee;
use ieee.std_logic_1164.all;
entity binaryCounter_nbit is
generic ( bit_width : integer := 16 ) ;
  port(
    i_clk : in std_logic; 
    i_enable : in std_logic;
    i_reset : in std_logic;
    o_count : out std_logic_vector(bit_width-1 downto 0)
  );
end binaryCounter_nbit;

architecture structural of binaryCounter_nbit is

component tFF IS
	PORT(
		i_t		: in	std_logic;
		i_clock		: in	std_logic;
		o_q, o_qBar	: out	std_logic);
end component;

  signal int_count : std_logic_vector(bit_width-1 downto 0);
  signal int_t : std_logic_vector(bit_width-1 downto 0);

begin

  o_count <= int_count;
  int_t(0) <= i_enable;-- or (i_reset and int_count(0));


  t_i: for i in bit_width-1 downto 1 generate
  begin
    int_t(i) <= (int_count(i-1) and int_t(i-1)) or (int_count(i) and i_reset);
  end generate;

  bits: for i in bit_width-1 downto 0 generate
  begin
      bit: tFF
      port map (
        i_clock => i_clk,
        i_t => int_t(i),
        o_q => int_count(i)
      );
  end generate;
end architecture;

library ieee;
use ieee.std_logic_1164.all;
entity binaryCounter_16bit_TB is 
  end binaryCounter_16bit_TB;

architecture testbench of binaryCounter_16bit_TB is 
  signal clock_tb : std_logic := '0';
  signal reset_tb: std_logic := '0';
  signal enable_tb: std_logic := '0';

  signal count_tb : std_logic_vector(15 downto 0) := "0000000000000000";

  signal sim_end : BOOLEAN := false;
  constant CLOCK_PERIOD : time := 10 ns;

  component binaryCounter_nbit is
  generic ( bit_width : integer := 16 ) ;
    port(
      i_clk : in std_logic; 
      i_reset : in std_logic;
      i_enable : in std_logic;
      o_count : out std_logic_vector(bit_width-1 downto 0)
    );
  end component;

begin
  dut: binaryCounter_nbit
  generic map (bit_width => 16)
  port map (
    i_clk => clock_tb,
    i_reset => reset_tb,
    i_enable => enable_tb,
    o_count => count_tb
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

  stimulus: 
process begin 
  
  enable_tb <= '1';

  wait for clock_period;
  wait for clock_period;
  wait for clock_period;
  wait for clock_period;
  wait for clock_period;
  wait for clock_period;
  wait for clock_period;
  wait for clock_period;
  wait for clock_period;

  sim_end <= true;

end process stimulus;
end testbench;
