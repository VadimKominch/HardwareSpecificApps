library ieee;
use ieee.std_logic_1164.all;

entity shift_one is
  port(
  x_in:in std_logic_vector(12 downto 0);
  x_out:out std_logic_vector(12 downto 0)
  );
end shift_one;

architecture beh of shift_one is
begin
  x_out<=x_in(12)&x_in(12)&x_in(10 downto 0);
end beh;
