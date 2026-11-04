library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity trafficLightController is
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
end entity trafficLightController;

architecture structural of trafficLightController is

    -- Yellow light set time (5 seconds and 3 seconds)
    constant MT  : std_logic_vector(3 downto 0) := "0101";
    constant SST : std_logic_vector(3 downto 0) := "0011";

    component enardFF_2 is
        port (
            i_resetBar : in  std_logic;
            i_d        : in  std_logic;
            i_enable   : in  std_logic;
            i_clock    : in  std_logic;
            o_q        : out std_logic;
            o_qbar     : out std_logic
        );
    end component;

    component counter4 is
        port (
            i_clock    : in  std_logic;
            i_resetBar : in  std_logic;
            i_enable   : in  std_logic;
            o_count    : out std_logic_vector(3 downto 0)
        );
    end component;

    component comparator4 is
        port (
            i_a    : in  std_logic_vector(3 downto 0);
            i_b    : in  std_logic_vector(3 downto 0);
            o_gt   : out std_logic;
            o_lt   : out std_logic;
            o_gteq : out std_logic
        );
    end component;

    component hex_bcd_decoder is
        port (
            i_hex  : in  std_logic_vector(3 downto 0);
            o_bcd1 : out std_logic_vector(3 downto 0);
            o_bcd2 : out std_logic_vector(3 downto 0)
        );
    end component;

    -- State bits
    signal y3, y2, y1, y0 : std_logic;
    signal q0             : std_logic;

    -- Next-state signals
    signal Y3_in, Y2_in, Y1_in, Y0_in : std_logic;
    signal D_FF0                     : std_logic;

    -- Counter values
    signal count_MG, count_MY, count_SG, count_SY : std_logic_vector(3 downto 0);

    -- Comparator flags
    signal gteq_MG, gteq_MY, gteq_SG, gteq_SY : std_logic;
    signal g                                  : std_logic;

    -- Counter controls
    signal reset_MG, reset_MY, reset_SG, reset_SY : std_logic;
    signal en_MG                                   : std_logic;

    -- Internal active counter value
    signal activeCount : std_logic_vector(3 downto 0);

begin


    y0    <= not q0;
    D_FF0 <= not Y0_in;

    FF0: enardFF_2
        port map (
            i_resetBar => GReset,
            i_d        => D_FF0,
            i_enable   => '1',
            i_clock    => GClock,
            o_q        => q0,
            o_qbar     => open
        );

    FF1: enardFF_2
        port map (
            i_resetBar => GReset,
            i_d        => Y1_in,
            i_enable   => '1',
            i_clock    => GClock,
            o_q        => y1,
            o_qbar     => open
        );

    FF2: enardFF_2
        port map (
            i_resetBar => GReset,
            i_d        => Y2_in,
            i_enable   => '1',
            i_clock    => GClock,
            o_q        => y2,
            o_qbar     => open
        );

    FF3: enardFF_2
        port map (
            i_resetBar => GReset,
            i_d        => Y3_in,
            i_enable   => '1',
            i_clock    => GClock,
            o_q        => y3,
            o_qbar     => open
        );


    Y0_in <= (y3 and g) or (y0 and ((not g) or (not SSCS)));
    Y1_in <= (y0 and g and SSCS) or (y1 and (not g));
    Y2_in <= (y1 and g) or (y2 and (not g));
    Y3_in <= (y2 and g) or (y3 and (not g));


    MSTL(2) <= y0;             -- Green
    MSTL(1) <= y1;             -- Yellow
    MSTL(0) <= y2 or y3;       -- Red

    SSTL(2) <= y2;             -- Green
    SSTL(1) <= y3;             -- Yellow
    SSTL(0) <= y0 or y1;       -- Red


    reset_MG <= y0 and GReset;
    reset_MY <= y1 and GReset;
    reset_SG <= y2 and GReset;
    reset_SY <= y3 and GReset;

    en_MG <= not gteq_MG;


    C_MG: counter4
        port map (
            i_clock    => GClock,
            i_resetBar => reset_MG,
            i_enable   => en_MG,
            o_count    => count_MG
        );

    C_MY: counter4
        port map (
            i_clock    => GClock,
            i_resetBar => reset_MY,
            i_enable   => '1',
            o_count    => count_MY
        );

    C_SG: counter4
        port map (
            i_clock    => GClock,
            i_resetBar => reset_SG,
            i_enable   => '1',
            o_count    => count_SG
        );

    C_SY: counter4
        port map (
            i_clock    => GClock,
            i_resetBar => reset_SY,
            i_enable   => '1',
            o_count    => count_SY
        );


    CMP_MG: comparator4
        port map (
            i_a    => count_MG,
            i_b    => MSC,
            o_gt   => open,
            o_lt   => open,
            o_gteq => gteq_MG
        );

    CMP_MY: comparator4
        port map (
            i_a    => count_MY,
            i_b    => MT,
            o_gt   => open,
            o_lt   => open,
            o_gteq => gteq_MY
        );

    CMP_SG: comparator4
        port map (
            i_a    => count_SG,
            i_b    => SSC,
            o_gt   => open,
            o_lt   => open,
            o_gteq => gteq_SG
        );

    CMP_SY: comparator4
        port map (
            i_a    => count_SY,
            i_b    => SST,
            o_gt   => open,
            o_lt   => open,
            o_gteq => gteq_SY
        );

    -- only the counter of the active state can raise g
    -- (an idle counter sits at 0, and 0 >= 0 would be true when MSC or SSC = 0)
    g <= (y0 and gteq_MG) or (y1 and gteq_MY) or (y2 and gteq_SG) or (y3 and gteq_SY);


    activeCount <= count_MG or count_MY or count_SG or count_SY;

    BCD_DEC: hex_bcd_decoder
        port map (
            i_hex  => activeCount,
            o_bcd1 => BCD1,
            o_bcd2 => BCD2
        );



end architecture structural;