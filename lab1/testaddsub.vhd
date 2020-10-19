library ieee;
use ieee.std_logic_1164.all;

entity testaddsub is
end testaddsub;

architecture beh of testaddsub is

component addsub
  generic(
  Size:integer);
  port(
  a:in std_logic_vector(Size-1 downto 0);
  b:in std_logic_vector(Size-1 downto 0);
  op:in std_logic;
  c:out std_logic_vector(Size-1 downto 0));
end component;

signal a,b,c:std_logic_vector(12 downto 0);
signal op:std_logic;

begin
  op<='0',
  '1' after 100 ns;
  a<="1111111111100";
  b<="1111111111011";
a1:addsub generic map(13) port map(a,b,op,c);  
end beh;
