library ieee;
use ieee.std_logic_1164.all;

entity correction_posl is
  port(
  x_in:in std_logic_vector(12 downto 0);
  x_out:out std_logic_vector(12 downto 0)
  );
end correction_posl;

architecture beh of correction_posl is

component shifter
  port(
  x_in:in std_logic_vector(12 downto 0);
  x_out:out std_logic_vector(12 downto 0)
  );
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

signal x_out1,x_out2,x_out3,x_out4,x_out5,x_out6,x_out7,x_out8,x_out9,x_out10,x_out11,x_out12,x_out13:std_logic_vector(12 downto 0);
signal sum1,sum2,sum3,sum4,sum5,sum6,sum7,sum8,sum9,sum10,sum11,sum12:std_logic_vector(12 downto 0);

begin
  shift1:shifter port map(x_in,x_out1);
  s1:addsub generic map(13)  port map(x_out1,"0000000000000",'0',sum1);
  shift2:shifter port map(x_out1,x_out2);
  shift3:shifter port map(x_out2,x_out3);
  shift4:shifter port map(x_out3,x_out4);
  s2:addsub generic map(13)  port map(x_out4,sum1,'0',sum2);
  shift5:shifter port map(x_out4,x_out5);
  s3:addsub generic map(13)  port map(x_out5,sum2,'0',sum3);
  shift6:shifter port map(x_out5,x_out6);
  shift7:shifter port map(x_out6,x_out7);
  s4:addsub generic map(13)  port map(x_out7,sum3,'0',sum4);
  shift8:shifter port map(x_out7,x_out8);
  s5:addsub generic map(13)  port map(x_out8,sum4,'0',sum5);
  shift9:shifter port map(x_out8,x_out9);
  s6:addsub generic map(13)  port map(x_out9,sum5,'0',x_out);
end beh;
