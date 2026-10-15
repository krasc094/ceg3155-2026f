-- == CLOCK DIVIDER FOR NEXYS BOARD // 100MHZ
-- deps: binaryCounter_nbit, tFF
library ieee;
use ieee.std_logic_1164.all;
entity clockDiv_100mhz is
	port (
		i_clk_100mhz : in	std_logic;

    o_clk_50Mhz : out std_logic;
    o_clk_25Mhz : out std_logic;

    o_clk_40hz : out std_logic;
    o_clk_20hz : out std_logic;
    o_clk_10hz : out std_logic;
    o_clk_5hz : out std_logic
  );
end clockDiv_100Mhz;

architecture structural of clockDiv_100mhz is
  component binaryCounter_nbit is
  generic ( bit_width : integer := 29 ) ;
    port(
      i_clk : in std_logic; 
      i_enable : in std_logic;
      i_reset : in std_logic;
      o_count : out std_logic_vector(bit_width-1 downto 0)
    );
  end component;
  
  signal int_count : std_logic_vector(28 downto 0);
begin
  counter: binaryCounter_nbit
   generic map( bit_width => 29)
   port map(
      i_clk => i_clk_100mhz,
      i_enable => '1',
      i_reset => '0',
      o_count => int_count
  );

  o_clk_50Mhz <= int_count(1);
  o_clk_25Mhz <= int_count(2);

  o_clk_40hz <= int_count(25);
  o_clk_20hz <= int_count(26);
  o_clk_10hz <= int_count(27);
  o_clk_5hz <= int_count(28);

end architecture;

library ieee;
use ieee.std_logic_1164.all;
entity clockDiv_TB is 
  end clockDiv_TB;

architecture testbench of clockDiv_TB is 
  signal clock_tb : std_logic := '0';
  signal clock25Mhz_tb : std_logic := '0';
  signal clock20Hz_tb : std_logic := '0';

  signal sim_end : BOOLEAN := false;
  constant CLOCK_PERIOD : time := 10 ns;

component clockDiv_100mhz is
	port (
		i_clk_100mhz : in	std_logic;
    o_clk_25Mhz : out std_logic;
    o_clk_20hz : out std_logic;
    o_clk_10hz : out std_logic;
    o_clk_5hz : out std_logic
  );
end component;

begin
  dut: clockDiv_100mhz
   port map(
      i_clk_100mhz => clock_tb,
      o_clk_25Mhz => clock25Mhz_tb,
      o_clk_20hz => clock20Hz_tb
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
  

  wait for clock_period * 5000000;

  sim_end <= true;

end process stimulus;
end testbench;

