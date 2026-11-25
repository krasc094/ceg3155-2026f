library ieee;
use ieee.std_logic_1164.all;

-- idea, use an adder + two's component to make 
-- a counter that can increment and decrement

-- both inc + dec signals at the same time loads the value

entity incAndDecCounter is
  port (
    i_clock, i_reset : in std_logic;
    i_enable : in std_logic;

    i_inc, i_dec : in std_logic;
    i_setCount : in std_logic_vector(3 downto 0);

    o_count : out std_logic_vector(3 downto 0)  
  );
end entity;

architecture structural of incAndDecCounter is
  component enARdFF_2 IS
    PORT(
      i_resetBar	: in	std_logic;
      i_d		: in	std_logic;
      i_enable	: in	std_logic;
      i_clock		: in	std_logic;
      o_q, o_qBar	: out	std_logic);
  end component;
begin
  
end architecture;
