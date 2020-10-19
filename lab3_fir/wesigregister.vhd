library ieee;
use ieee.std_logic_1164.all;

entity wesigregister is
  generic(
  Size:integer);
  port(
  input:in std_logic_vector(Size-1 downto 0);
  clk:in std_logic;
  we:in std_logic;
  output:out std_logic_vector(Size-1 downto 0));
end wesigregister;

architecture beh of wesigregister is
signal temp:std_logic_vector(Size-1 downto 0);
begin
  process(clk)
    begin
    if(clk'event and clk='1') then
      if(we='1') then
    temp<=input;
      end if;
    end if;
  end process;
  output<=temp;
end beh;
