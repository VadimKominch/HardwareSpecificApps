library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity divider is
  port(
    x1:in std_logic_vector(15 downto 0);
    x2:in std_logic_vector(15 downto 0);
    x3:in std_logic_vector(15 downto 0);
    x4:in std_logic_vector(15 downto 0);
    clk:in std_logic;
    reset:in std_logic;
    x1_bit:out std_logic;
    x2_bit:out std_logic;
    x3_bit:out std_logic;
    x4_bit:out std_logic;
    Ts_bit:out std_logic);
end divider;

architecture beh of divider is
signal x1_temp,x2_temp,x3_temp,x4_temp:std_logic_vector(15 downto 0);
signal counter:std_logic_vector(3 downto 0);
begin
  
  process(reset,clk)
    begin
      if(reset='1') then
        x1_temp<=x1;
        x2_temp<=x2;
        x3_temp<=x3;
        x4_temp<=x4;
        counter<="0000";
        Ts_bit<='0';
      elsif(clk'event and clk='1') then
        counter<=counter+1;
        x1_bit<=x1_temp(0);
        x1_temp<='0'&x1_temp(14 downto 0);
        x2_bit<=x2_temp(0);
        x2_temp<='0'&x2_temp(14 downto 0);
        x3_bit<=x3_temp(0);
        x3_temp<='0'&x3_temp(14 downto 0);
        x4_bit<=x4_temp(0);
        x4_temp<='0'&x4_temp(14 downto 0);
        if(counter="1111") then
          counter<="0000";
          Ts_bit<='1';
        else
          Ts_bit<='0';
        end if;
    end if;
    end process;
  
end beh;