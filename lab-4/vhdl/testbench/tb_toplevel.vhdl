library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_lab4_topLevel is
end entity;

architecture testbench of tb_lab4_topLevel is

  component lab4_topLevel is
    port (
      GClock : in std_logic;
      GReset : in std_logic;
      KbClock : in std_logic;
      KbInfo : in std_logic;
      BCD1 : out std_logic_vector(3 downto 0);
      BCD2 : out std_logic_vector(3 downto 0)
    );
  end component;

  constant CLOCK_PERIOD : time := 10 ns;

  constant KB_HALF : time := 2 us;

  signal sim_end : boolean := false;
  signal clock_tb : std_logic := '0';
  signal reset_tb : std_logic := '1';
  signal kbClk_tb : std_logic := '1';
  signal kbData_tb : std_logic := '1';
  signal bcd1_tb, bcd2_tb : std_logic_vector(3 downto 0);
  signal code_tb : std_logic_vector(7 downto 0) := (others => '0');


  function to_str(v : std_logic_vector) return string is
    variable s : string(1 to v'length);
    variable k : integer := 1;
  begin
    for i in v'range loop
      s(k) := std_logic'image(v(i))(2);
      k := k + 1;
    end loop;
    return s;
  end function;

begin

  dut: lab4_topLevel
    port map(
      GClock => clock_tb,
      GReset => reset_tb,
      KbClock => kbClk_tb,
      KbInfo => kbData_tb,
      BCD1 => bcd1_tb,
      BCD2 => bcd2_tb
    );

  clock_process:
  process begin
    while (not sim_end) loop
      clock_tb <= '1';
      wait for CLOCK_PERIOD / 2;
      clock_tb <= '0';
      wait for CLOCK_PERIOD / 2;
    end loop;
    wait;
  end process clock_process;

  stimulus:
  process
    procedure send_bit(b : std_logic) is
    begin
      kbData_tb <= b;
      wait for KB_HALF / 2;
      kbClk_tb <= '0';
      wait for KB_HALF;
      kbClk_tb <= '1';
      wait for KB_HALF / 2;
    end procedure;

    procedure send_byte(code : std_logic_vector(7 downto 0)) is
      variable parity : std_logic := '1';
    begin
      send_bit('0');
      for i in 0 to 7 loop
        send_bit(code(i));
        parity := parity xor code(i);
      end loop;
      send_bit(parity);
      send_bit('1');
      kbData_tb <= '1';
      wait for 10 * KB_HALF;
    end procedure;

    procedure check(code : std_logic_vector(7 downto 0)) is
      variable n : integer;
      variable exp1, exp2 : std_logic_vector(3 downto 0);
    begin
      n := to_integer(unsigned(code(3 downto 0)));
      exp1 := std_logic_vector(to_unsigned(n / 10, 4));
      exp2 := std_logic_vector(to_unsigned(n mod 10, 4));
      assert bcd1_tb = exp1 and bcd2_tb = exp2
        report "code " & to_str(code) & ": expected BCD1=" & to_str(exp1) & " BCD2=" & to_str(exp2) &
               ", got BCD1=" & to_str(bcd1_tb) & " BCD2=" & to_str(bcd2_tb)
        severity error;
      report "code " & to_str(code) & " -> BCD1=" & to_str(bcd1_tb) & " BCD2=" & to_str(bcd2_tb);
    end procedure;

    type code_array is array (natural range <>) of std_logic_vector(7 downto 0);
    constant codes : code_array := (x"16", x"1C", x"45");
  begin
    wait for 100 ns;
    reset_tb <= '0';
    wait for 1 us;

    for i in codes'range loop
      code_tb <= codes(i);
      send_byte(codes(i));
      check(codes(i));
    end loop;

    sim_end <= true;
    wait;
  end process stimulus;

end architecture;