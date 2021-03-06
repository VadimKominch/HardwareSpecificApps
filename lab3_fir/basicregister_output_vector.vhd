library ieee;
use ieee.std_logic_1164.all;

entity basicregister_output_vector is
  generic(
  Size:integer);
  port(
  input:in std_logic;
  clk:in std_logic;
  output:out std_logic_vector(Size-1 downto 0));
end basicregister_output_vector;

architecture beh of basicregister_output_vector is
signal temp:std_logic_vector(Size-1 downto 0);
begin
  process(clk)
    begin
    if(clk'event and clk = '1') then
    temp<=input&temp(Size-1 downto 1);
    end if;
  end process;
  output<=temp;
end beh;
