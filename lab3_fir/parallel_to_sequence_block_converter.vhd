library ieee;
use ieee.std_logic_1164.all;

entity parallel_to_sequence_block_converter is
  generic(
  WIDTH:integer
  );
  port(
  input_word:in std_logic_vector(WIDTH-1 downto 0);
  clk:in std_logic;
  load:in std_logic;
  output_bit:out std_logic
  );
end parallel_to_sequence_block_converter;
  
  architecture beh of parallel_to_sequence_block_converter is
  
  signal reg:std_logic_vector(WIDTH-1 downto 0);
  
  begin
    process(clk)
      begin
        if(load='1') then
          reg<=input_word;
        elsif(rising_edge(clk)) then
          reg<=reg(15 downto 1)&'0';
        end if;
    end process;
    output_bit<=reg(0);
  end beh;
