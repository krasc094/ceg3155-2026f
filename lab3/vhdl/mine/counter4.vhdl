library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity counter4 is
    port (
        i_clock    : in  std_logic;
        i_resetBar : in  std_logic;   
        i_enable   : in  std_logic;
        o_count    : out std_logic_vector(3 downto 0)
    );
end entity counter4;

architecture structural of counter4 is

    component enardFF_2 is
        PORT(
            i_resetBar	: IN	STD_LOGIC;
            i_d		: IN	STD_LOGIC;
            i_enable	: IN	STD_LOGIC;
            i_clock		: IN	STD_LOGIC;
            o_q, o_qBar	: OUT	STD_LOGIC);
    end component;

    component adder4 is
        port (
            i_a    : in  std_logic_vector(3 downto 0);
            i_b    : in  std_logic_vector(3 downto 0);
            i_cin  : in  std_logic;
            o_sum  : out std_logic_vector(3 downto 0);
            o_cout : out std_logic
        );
    end component;

    signal s_count    : std_logic_vector(3 downto 0);
    signal s_next_sum : std_logic_vector(3 downto 0);

begin
    ADDER_INST: adder4
        port map ( i_a => s_count, i_b => "0000", i_cin => '1',
                   o_sum => s_next_sum, o_cout => open );

    GEN_FF: for i in 0 to 3 generate
        FF_i: enardFF_2
            port map (
                i_resetBar => i_resetBar,
                i_d        => s_next_sum(i),
                i_enable   => i_enable,
                i_clock    => i_clock,
                o_q        => s_count(i),
                o_qbar     => open
            );
    end generate GEN_FF;

    o_count <= s_count;
end architecture structural;