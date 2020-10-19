library ieee;
use ieee.std_logic_1164.all;

entity test_core is
end test_core;

architecture beh of test_core is

component core
  port(
  x1:in std_logic;
  x2:in std_logic;
  x3:in std_logic;
  x4:in std_logic;
  Ts:in std_logic;
  clk:in std_logic;
  reset:in std_logic;
  y:out std_logic_vector(15 downto 0));
end component;


signal clk:std_logic:='0';
signal x1,x2,x3,x4,Ts,reset:std_logic;
signal y:std_logic_vector(15 downto 0);

begin
  reset<='0',
  '1' after 10 ns,
  '0' after 30 ns;
  clk<=not clk after 10 ns;
  x4<='0';--,
--      '1' after 290 ns,
--      '0' after 310 ns;
  x2<='0';
  x3<='0';
  x1<='0',
      '1' after 290 ns,
      '0' after 310 ns;
  Ts<='0',
  '1' after 310 ns,
  '0' after 330 ns;
  c1:core port map(x1,x2,x3,x4,Ts,clk,reset,y);
end beh;
