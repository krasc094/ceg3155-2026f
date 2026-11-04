library ieee;
use ieee.std_logic_1164.all;

entity tb_trafficLightController is
end entity tb_trafficLightController;

architecture sim of tb_trafficLightController is

  component trafficLightController is
    port (
      GClock : in  std_logic;
      GReset : in  std_logic;
      SSCS   : in  std_logic;
      MSC    : in  std_logic_vector(3 downto 0);
      SSC    : in  std_logic_vector(3 downto 0);
      MSTL   : out std_logic_vector(2 downto 0);
      SSTL   : out std_logic_vector(2 downto 0);
      BCD1   : out std_logic_vector(3 downto 0);
      BCD2   : out std_logic_vector(3 downto 0)
    );
  end component;

  signal clk      : std_logic := '0';
  signal resetbar : std_logic := '0';
  signal car      : std_logic := '0';
  signal msc      : std_logic_vector(3 downto 0) := "0110";   -- 6
  signal ssc      : std_logic_vector(3 downto 0) := "0010";   -- 2
  signal ms_light : std_logic_vector(2 downto 0);             -- 100 G, 010 Y, 001 R
  signal ss_light : std_logic_vector(2 downto 0);
  signal bcd1     : std_logic_vector(3 downto 0);             -- tens
  signal bcd2     : std_logic_vector(3 downto 0);             -- ones
  signal sim_end  : std_logic := '0';

begin

  dut : trafficLightController
    port map (GClock => clk, GReset => resetbar, SSCS => car, MSC => msc, SSC => ssc,
              MSTL => ms_light, SSTL => ss_light, BCD1 => bcd1, BCD2 => bcd2);

  clk <= not clk after 5 ns when sim_end = '0' else '0';

  stim : process
  begin
    resetbar <= '0';  wait for 20 ns;     -- reset
    resetbar <= '1';  wait for 200 ns;    -- no car
    car <= '1';  wait for 20 ns;          -- car arrives after MSC
    car <= '0';  wait for 300 ns;
    car <= '1';  wait for 600 ns;         -- car waiting
    car <= '0';  wait for 300 ns;
    msc <= "0011";  ssc <= "1001";        -- MSC = 3, SSC = 9
    car <= '1';  wait for 20 ns;
    car <= '0';  wait for 400 ns;
    car <= '1';  wait for 150 ns;         -- reset during SS green
    resetbar <= '0';  wait for 20 ns;
    resetbar <= '1';  car <= '0';  wait for 100 ns;
    sim_end <= '1';
    wait;
  end process stim;

end architecture sim;
