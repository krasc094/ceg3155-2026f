library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comparator4 is
    port (
        i_a, i_b : in  std_logic_vector(3 downto 0);
        o_gt     : out std_logic;
        o_lt     : out std_logic;   
        o_gteq   : out std_logic    
    );
end entity comparator4;

architecture structural of comparator4 is

    component onebitcomparator is
        PORT(
            i_GTPrevious, i_LTPrevious	: IN	STD_LOGIC;
            i_Ai, i_Bi			: IN	STD_LOGIC;
            o_GT, o_LT			: OUT	STD_LOGIC
        );
    end component;
    
    signal gt, lt: std_logic_vector(4 downto 0);
begin
gt(4) <= '0';
lt(4) <= '0';
COMP3: oneBitComparator port map (i_GTPrevious => gt(4), i_LTPrevious => lt(4),
                                  i_Ai => i_a(3), i_Bi => i_b(3),
                                  o_GT => gt(3), o_LT => lt(3));
COMP2: oneBitComparator port map (i_GTPrevious => gt(3), i_LTPrevious => lt(3),
                                  i_Ai => i_a(2), i_Bi => i_b(2),
                                  o_GT => gt(2), o_LT => lt(2));

COMP1: oneBitComparator port map (i_GTPrevious => gt(2), i_LTPrevious => lt(2),
                                  i_Ai => i_a(1), i_Bi => i_b(1),
                                  o_GT => gt(1), o_LT => lt(1));
COMP0: oneBitComparator port map (i_GTPrevious => gt(1), i_LTPrevious => lt(1),
                                  i_Ai => i_a(0), i_Bi => i_b(0),
                                  o_GT => gt(0), o_LT => lt(0));

    o_gt   <= gt(0);
    o_lt   <= lt(0);
    o_gteq <= not lt(0);
end architecture structural;