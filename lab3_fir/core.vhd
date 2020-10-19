library ieee;
use ieee.std_logic_1164.all;

entity core is
  port(
  x1:in std_logic;
  x2:in std_logic;
  x3:in std_logic;
  x4:in std_logic;
  Ts:in std_logic;
  clk:in std_logic;
  reset:in std_logic;
  y:out std_logic_vector(15 downto 0));
end core;

architecture beh of core is

component mux
  generic(
  Size:integer
  );
  port(
  a:in std_logic_vector(Size-1 downto 0);
  b:in std_logic_vector(Size-1 downto 0);
  control:in std_logic;
  c:out std_logic_vector(Size-1 downto 0));
end component;

component reg
  generic(
  Size:integer);
  port(
  input:in std_logic_vector(Size-1 downto 0);
  clk:in std_logic;
  output:out std_logic_vector(Size-1 downto 0));
end component;

component addsub
  generic(
  Size:integer);
  port(
  a:in std_logic_vector(Size-1 downto 0);
  b:in std_logic_vector(Size-1 downto 0);
  control:in std_logic;
  c:out std_logic_vector(Size-1 downto 0));
end component;

component ROM
 port(
 addr: in std_logic_vector(2 downto 0);
 --clk:in std_logic;
 output:out std_logic_vector(15 downto 0));
 end component;

component init_reg
port(
input:in std_logic_vector(15 downto 0);
clk:in std_logic;
output:out std_logic_vector(15 downto 0));
end component;

signal iv,output_mux1,output_rom:std_logic_vector(15 downto 0);
signal output_sum, shifted:std_logic_vector(15 downto 0);
signal a_addr:std_logic_vector(2 downto 0);
signal a1,a2,a3,aTs:std_logic;

begin
aTs<=x1 xor Ts;
a1<=x2 xor x1;
a2<=x3 xor x1;
a3<=x4 xor x1;
a_addr<=a1&a2&a3;
initial_val:init_reg port map("1101000010100100",clk,iv);
mux1:mux generic map(16) port map(shifted,iv,reset,output_mux1);
rom1:ROM port map(a_addr,output_rom);
add1:addsub generic map(16) port map(output_mux1,output_rom,aTs,output_sum);
reg1:reg generic map(16) port map(output_sum,clk,shifted);
y<=output_sum(15)&output_sum(13 downto 0)&output_sum(15);--shift output left one bit to garantee the correct result
end beh;
