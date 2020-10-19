library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity addsub is
  generic(
  Size:integer);
  port(
  a:in std_logic_vector(Size-1 downto 0);
  b:in std_logic_vector(Size-1 downto 0);
  op:in std_logic;
  c:out std_logic_vector(Size-1 downto 0));
end addsub;

architecture beh of addsub is

begin
process(a,b,op)
begin
  if(op='0') then
    c<=std_logic_vector(signed(a) + signed(b));
  else
    c<=std_logic_vector(signed(a) - signed(b));
  end if;
end process;  
end beh;
