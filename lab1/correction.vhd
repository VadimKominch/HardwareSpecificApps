library ieee;
use ieee.std_logic_1164.all;

entity correction is
  port(
  x_in:in std_logic_vector(12 downto 0);
  y_in:in std_logic_vector(12 downto 0);
  clk:in std_logic;
  start:in std_logic;
  x_out:out std_logic_vector(12 downto 0);
  y_out:out std_logic_vector(12 downto 0);
  ready:out std_logic 
  );
end correction;

architecture beh of correction is

 
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

component addsub
generic(
  Size:integer);
port(
  a:in std_logic_vector(Size-1 downto 0);
  b:in std_logic_vector(Size-1 downto 0);
  op:in std_logic;
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

signal shifted,out_sum2,out_reg,out_mux1,out_mux2,out_sum:std_logic_vector(12 downto 0);
signal out_shift_vect,it_num_out,out_mux_vect:std_logic_vector(10 downto 0);

begin
  reg_vector:process(clk,start,out_mux_vect,out_reg)
    begin
      if(clk='1' and clk'event) then
      out_shift_vect<='0'&out_mux_vect(10 downto 1);
      shifted<=out_reg(12)&out_reg(12)&out_reg(10 downto 0);
      end if;
    end process;
  
mux_vect:mux generic map(11) port map(out_shift_vect,"10011011011",start,out_mux_vect); 
  
mux1:mux generic map(13) port map(out_sum,"0000000000000",start,out_mux1);
reg1:reg generic map(13) port map(out_mux1,clk,out_reg);  
mux2:mux generic map(13) port map(shifted,x_in,start,out_mux2);
mux3:mux generic map(13) port map(shifted,"0000000000000",out_mux_vect(10),out_sum2);
addsub1:addsub generic map(13) port map(out_reg,out_sum2,'0',out_sum);  
x_out<=out_sum;
end beh;
