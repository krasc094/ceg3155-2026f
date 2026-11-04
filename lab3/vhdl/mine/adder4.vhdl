library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adder4 is
    port (
        i_a    : in  std_logic_vector(3 downto 0);
        i_b    : in  std_logic_vector(3 downto 0);
        i_cin  : in  std_logic;
        o_sum  : out std_logic_vector(3 downto 0);
        o_cout : out std_logic
    );
end entity adder4;

architecture structural of adder4 is

    component onebitadder is
         port (
             i_CarryIn         : in  std_logic;
             i_Ai, i_Bi        : in  std_logic;
             o_Sum, o_CarryOut : out std_logic
         );
    end component;

    signal c : std_logic_vector(3 downto 1);

begin
    FA0: onebitadder port map ( i_Ai=>i_a(0), i_Bi=>i_b(0), i_CarryIn=>i_cin, o_Sum=>o_sum(0), o_CarryOut=>c(1) );
    FA1: onebitadder port map ( i_Ai=>i_a(1), i_Bi=>i_b(1), i_CarryIn=>c(1),   o_Sum=>o_sum(1), o_CarryOut=>c(2) );
    FA2: onebitadder port map ( i_Ai=>i_a(2), i_Bi=>i_b(2), i_CarryIn=>c(2),   o_Sum=>o_sum(2), o_CarryOut=>c(3) );
    FA3: onebitadder port map ( i_Ai=>i_a(3), i_Bi=>i_b(3), i_CarryIn=>c(3),   o_Sum=>o_sum(3), o_CarryOut=>o_cout );
end architecture structural;