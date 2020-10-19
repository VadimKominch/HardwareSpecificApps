library ieee;
use ieee.std_logic_1164.all;

entity init_reg is
port(
input:in std_logic_vector(15 downto 0);
clk:in std_logic;
output:out std_logic_vector(15 downto 0));
end init_reg;

architecture beh of init_reg is
signal temp:std_logic_vector(15 downto 0);
begin
  process(clk)
    begin
     if(clk='1' and clk'event) then 
      temp<=input;
      end if;
    end process;
    output<=temp;
end beh;
