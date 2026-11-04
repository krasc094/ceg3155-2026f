library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TopLevel_trafficLightBoard is
    port (
        CLK100MHZ  : in  std_logic;
        CPU_RESETN : in  std_logic;                     -- global reset, active low
        BTNC       : in  std_logic;                     -- car sensor
        SW         : in  std_logic_vector(7 downto 0);  -- 7-4 = MSC, 3-0 = SSC

        LED        : out std_logic_vector(5 downto 0);  -- 5-3 = MSTL, 2-0 = SSTL
        AN         : out std_logic_vector(7 downto 0);
        SEG        : out std_logic_vector(6 downto 0)
    );
end entity TopLevel_trafficLightBoard;

architecture structural of TopLevel_trafficLightBoard is

    component clk_div is
        port (
            clock_100Mhz : in  std_logic;
            clock_1MHz, clock_100KHz, clock_10KHz, clock_1KHz,
            clock_100Hz, clock_10Hz, clock_1Hz : out std_logic
        );
    end component;

    component debouncer is
        port (
            i_raw   : in  std_logic;
            i_clock : in  std_logic;
            o_clean : out std_logic
        );
    end component;

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

    component sevenSeg is
        port (
            i_clk      : in  std_logic;
            i_resetBar : in  std_logic;
            i_bcd1     : in  std_logic_vector(3 downto 0);
            i_bcd2     : in  std_logic_vector(3 downto 0);
            o_an       : out std_logic_vector(7 downto 0);
            o_seg      : out std_logic_vector(6 downto 0)
        );
    end component;

    signal s_1Hz  : std_logic;   -- controller and debouncer clock
    signal s_1kHz : std_logic;   -- display clock
    signal s_car  : std_logic;   -- debounced car sensor
    signal s_bcd1 : std_logic_vector(3 downto 0);
    signal s_bcd2 : std_logic_vector(3 downto 0);

begin

    -- 1) Clock divider: 100 MHz -> 1 kHz (display) and 1 Hz (controller)
    CLKDIV_INST: clk_div
        port map (
            clock_100Mhz => CLK100MHZ,
            clock_1MHz   => open,
            clock_100KHz => open,
            clock_10KHz  => open,
            clock_1KHz   => s_1kHz,
            clock_100Hz  => open,
            clock_10Hz   => open,
            clock_1Hz    => s_1Hz
        );

    -- 2) Debounce the car sensor, on the same clock as the controller
    DEB_INST: debouncer
        port map (
            i_raw   => BTNC,
            i_clock => s_1Hz,
            o_clean => s_car
        );

    -- 3) Traffic light controller
    FSM_INST: trafficLightController
        port map (
            GClock => s_1Hz,
            GReset => CPU_RESETN,
            SSCS   => s_car,
            MSC    => SW(7 downto 4),
            SSC    => SW(3 downto 0),
            MSTL   => LED(5 downto 3),
            SSTL   => LED(2 downto 0),
            BCD1   => s_bcd1,
            BCD2   => s_bcd2
        );

    -- 4) 7-segment display: tens on the left digit, ones on the right
    DISP_INST: sevenSeg
        port map (
            i_clk      => s_1kHz,
            i_resetBar => CPU_RESETN,
            i_bcd1     => s_bcd1,
            i_bcd2     => s_bcd2,
            o_an       => AN,
            o_seg      => SEG
        );

end architecture structural;