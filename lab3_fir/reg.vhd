library ieee;
use ieee.std_logic_1164.all;

entity reg is
  generic(
  Size:integer);
  port(
  input:in std_logic_vector(Size-1 downto 0);
  clk:in std_logic;
  output:out std_logic_vector(Size-1 downto 0));
end reg;

architecture beh of reg is
signal temp:std_logic_vector(Size-1 downto 0);
begin
  process(clk)
    begin
    if(clk'event and clk='1') then
    output<=input(Size-1)&input(Size-1)&input(Size-2 downto 1);
    end if;
    end process;
end beh;
