library ieee;
use ieee.std_logic_1164.all;

entity shifter is
  port(
  x_in:in std_logic_vector(12 downto 0);
  x_out:out std_logic_vector(12 downto 0)
  );
end shifter;

architecture beh of shifter is
begin
  x_out<=x_in(12)&x_in(12)&x_in(11 downto 1);
end beh;
