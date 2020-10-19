library ieee;
use ieee.std_logic_1164.all;

entity CORDIC is
  port(
  x:in std_logic_vector(12 downto 0);
  y:in std_logic_vector(12 downto 0);
  angle:in std_logic_vector(12 downto 0);
  start:in std_logic;
  clk:in std_logic;
  ready:out std_logic;
  x_out:out std_logic_vector(12 downto 0);
  y_out:out std_logic_vector(12 downto 0));
end CORDIC;

architecture beh of CORDIC is

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
  Size:integer
  );
  port(
  a:in std_logic_vector(Size-1 downto 0);
  clk:in std_logic;
  b:out std_logic_vector(Size-1 downto 0));
end component;

component ROM
  port(
  addr:in std_logic_vector(3 downto 0);
  b:out std_logic_vector(12 downto 0));
end component;

component addsub
  generic(
  Size:integer);
  port(
  a:in std_logic_vector(Size-1 downto 0);
  b:in std_logic_vector(Size-1 downto 0);
  op:in std_logic;
  c:out std_logic_vector(Size-1 downto 0));
end component;

component counter
  port(
  clk:in std_logic;
  reset:in std_logic;
  number:out std_logic_vector(3 downto 0));
end component;

component custom_shifter
  port(
  a:in std_logic_vector(12 downto 0);
  shift:in std_logic_vector(3 downto 0);
  b:out std_logic_vector(12 downto 0));
end component;

component correction_posl
  port(
  x_in:in std_logic_vector(12 downto 0);
  x_out:out std_logic_vector(12 downto 0)
  );
end component;

signal number:std_logic_vector(3 downto 0);
signal output_iter_x,output_iter_y,output_mux_a,output_mux_b,output_sum,output_sub:std_logic_vector(12 downto 0);
signal output_reg_a,output_reg_b,ROM_output,shifted_a,shifted_b:std_logic_vector(12 downto 0);
signal output_iter_angle,output_reg_angle,output_mux_angle:std_logic_vector(12 downto 0);
signal operation1,operation2:std_logic;


begin
  
process(number)
begin
  if(number="1011") then
    ready<='1';
  else
    ready<='0';
    end if;
end process;  
c1:counter port map(clk,start,number);
--iteration input
m1:mux generic map(13) port map(output_iter_x,x,start,output_mux_a);
m2:mux generic map(13) port map(output_iter_y,y,start,output_mux_b);
m3:mux generic map(13) port map(output_iter_angle,angle,start,output_mux_angle);

reg_a:reg generic map(13) port map(output_mux_a,clk,output_reg_a);
reg_b:reg generic map(13) port map(output_mux_b,clk,output_reg_b);
reg_angle:reg generic map(13) port map(output_mux_angle,clk,output_reg_angle);

rom1:ROM port map(number,ROM_output);

--shift functions
s_a:custom_shifter port map(output_reg_a,number,shifted_a);
s_b:custom_shifter port map(output_reg_b,number,shifted_b);

operation1<=not output_reg_angle(12);
operation2<=output_reg_angle(12);

s1:addsub generic map(13) port map(output_reg_a,shifted_b,operation1,output_iter_x);
s2:addsub generic map(13) port map(output_reg_b,shifted_a,operation2,output_iter_y);
--end of iteration
s3:addsub generic map(13) port map(output_reg_angle,ROM_output,operation1,output_iter_angle);
--end of angle counting
cor1:correction_posl port map(output_iter_x,x_out);
cor2:correction_posl port map(output_iter_y,y_out);
end beh;