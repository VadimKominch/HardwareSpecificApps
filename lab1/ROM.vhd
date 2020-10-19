library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity ROM is
  port(
  addr:in std_logic_vector(3 downto 0);
  b:out std_logic_vector(12 downto 0));
end ROM;

architecture beh of ROM is
type memory is array (0 to 15) of std_logic_vector(12 downto 0);
constant ROM_table :memory := (
0 => "0011001001000",
1 => "0001110110110",
2 => "0000111110110",
3 => "0000011111111",
4 => "0000010000000",
5 => "0000001000000",
6 => "0000000100000",
7 => "0000000010000",
8 => "0000000001000",
9 => "0000000000100",
10 => "0000000000010",
11 => "0000000000001",
others => "0000000000000");

begin
       b<=ROM_table(conv_integer(addr));
end beh;
