library ieee;
use ieee.std_logic_1164.all;

entity custom_shifter is
  port(
  a:in std_logic_vector(12 downto 0);
  shift:in std_logic_vector(3 downto 0);
  b:out std_logic_vector(12 downto 0));
end custom_shifter;

architecture beh of custom_shifter is

begin
  process(a,shift)
begin
case shift is
when "0000"=>b<=a;
when "0001"=>b<=a(12)&a(12)&a(11 downto 1);
when "0010"=>b<=a(12)&a(12)&a(12)&a(11 downto 2);
when "0011"=>b<=a(12)&a(12)&a(12)&a(12)&a(11 downto 3);
when "0100"=>b<=a(12)&a(12)&a(12)&a(12)&a(12)&a(11 downto 4);
when "0101"=>b<=a(12)&a(12)&a(12)&a(12)&a(12)&a(12)&a(11 downto 5);
when "0110"=>b<=a(12)&a(12)&a(12)&a(12)&a(12)&a(12)&a(12)&a(11 downto 6);
when "0111"=>b<=a(12)&a(12)&a(12)&a(12)&a(12)&a(12)&a(12)&a(12)&a(11 downto 7);
when "1000"=>b<=a(12)&a(12)&a(12)&a(12)&a(12)&a(12)&a(12)&a(12)&a(12)&a(11 downto 8);
when "1001"=>b<=a(12)&a(12)&a(12)&a(12)&a(12)&a(12)&a(12)&a(12)&a(12)&a(12)&a(11 downto 9);
when "1010"=>b<=a(12)&a(12)&a(12)&a(12)&a(12)&a(12)&a(12)&a(12)&a(12)&a(12)&a(12)&a(11 downto 10);
when "1011"=>b<=a(12)&a(12)&a(12)&a(12)&a(12)&a(12)&a(12)&a(12)&a(12)&a(12)&a(12)&a(12)&a(11);
when others=>b<=a;
end case;
end process;
end beh;