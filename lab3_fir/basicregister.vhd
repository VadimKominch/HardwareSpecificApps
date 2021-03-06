library ieee;
use ieee.std_logic_1164.all;

entity basicregister is
  generic(
  Size:integer);
  port(
  input:in std_logic;
  clk:in std_logic;
  output:out std_logic);
end basicregister;

architecture beh of basicregister is
signal temp:std_logic_vector(Size-1 downto 0);
begin
  process(clk)
    begin
    if(clk'event and clk = '1') then
    temp<=input&temp(Size-1 downto 1);
    end if;
  end process;
  output<=temp(0);
end beh;
