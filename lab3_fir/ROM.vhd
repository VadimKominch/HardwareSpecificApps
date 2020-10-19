library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ROM is
 port(
 addr: in std_logic_vector(2 downto 0);
 output:out std_logic_vector(15 downto 0));
 end ROM;
 
 architecture beh of ROM is
 type coefc is array ( 0 to 7 ) of std_logic_vector( 15 downto 0 ) ;
 --bit for sign
 --msb is 2^0 bit to store numbers bigger than one
 constant myrom : coefc := (
0 => "1101000010100100",
1 => "1101011110101110",
2 => "0000110101110001",
3 => "0001010001111011",
4 => "1011110101110001",
5 => "1100010001111011",
6 => "1111101000111101",
7 => "0000000101001000");

 begin
   output <= myrom(to_integer(unsigned(addr)));
 end beh;
