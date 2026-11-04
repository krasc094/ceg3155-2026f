library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sevenSeg is
    port (
        i_clk      : in  std_logic;                     
        i_resetBar : in  std_logic;                     
        i_bcd1     : in  std_logic_vector(3 downto 0);  -- tens / left digit
        i_bcd2     : in  std_logic_vector(3 downto 0);  -- ones / right digit
        o_an       : out std_logic_vector(7 downto 0);
        o_seg      : out std_logic_vector(6 downto 0)
    );
end entity sevenSeg;

architecture structural of sevenSeg is

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

    component dec_7seg is                                
        port (
            i_hexDigit  : in  std_logic_vector(3 downto 0);
            o_segment_a, o_segment_b, o_segment_c, o_segment_d, o_segment_e,
            o_segment_f, o_segment_g : out std_logic
        );
    end component;

    signal sel     : std_logic;
    signal sel_n   : std_logic;                          
    signal sel_bcd : std_logic_vector(3 downto 0);

begin

    -- toggles every clock: sel = 0, 1, 0, 1 ...
    FF: enardFF_2
        port map (
            i_resetBar => i_resetBar,
            i_d        => sel_n,                         
            i_enable   => '1',
            i_clock    => i_clk,
            o_q        => sel,
            o_qbar     => sel_n                          
        );

    -- pick the digit to show
    sel_bcd(0) <= i_bcd2(0) when sel = '0' else i_bcd1(0);
    sel_bcd(1) <= i_bcd2(1) when sel = '0' else i_bcd1(1);
    sel_bcd(2) <= i_bcd2(2) when sel = '0' else i_bcd1(2);
    sel_bcd(3) <= i_bcd2(3) when sel = '0' else i_bcd1(3);

    -- sel = 0: right digit (ones), sel = 1: left digit (tens)
    o_an <= "11111110" when sel = '0' else "11111101";

    DEC: dec_7seg
        port map (                                       
            i_hexDigit  => sel_bcd,
            o_segment_a => o_seg(0),
            o_segment_b => o_seg(1),
            o_segment_c => o_seg(2),
            o_segment_d => o_seg(3),
            o_segment_e => o_seg(4),
            o_segment_f => o_seg(5),
            o_segment_g => o_seg(6)
        );

end architecture structural;