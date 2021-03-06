library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ROM is
 port(
 addr: in std_logic_vector(2 downto 0);
 --clk:in std_logic;
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
 
--constant myrom : coefc := (
--7 => x"50A4",
--6 => x"F47B",
--5 => x"770A",
--4 => x"1AE1",
--3 => x"D70A",
--2 => x"7AE1",
--1 => x"FD70",
--0 => x"A147");
 begin
   output <= myrom(to_integer(unsigned(addr)));
--   process(clk)
--    begin
--      if(clk='1' and clk'event) then
--    output <= myrom(to_integer(unsigned(addr(7 downto 0))));
--  end if;
--  end process;
 end beh;
