library ieee;
use ieee.std_logic_1164.all;

entity test_par_to_seq_converter is
end test_par_to_seq_converter;

architecture beh of test_par_to_seq_converter is

component parallel_to_sequence_block_converter
generic(
  WIDTH:integer
  );
port(
  input_word:in std_logic_vector(WIDTH-1 downto 0);
  clk:in std_logic;
  load:in std_logic;
  output_bit:out std_logic
  );
end component;

signal temp_input:std_logic_vector(15 downto 0);
signal clk:std_logic:='0';
signal output_bit,load:std_logic;

begin
  clk<= not clk after 10 ns;
  load<='0',
  '1' after 30 ns,
  '0' after 50 ns;
  temp_input<=x"ABCE";
  c1:parallel_to_sequence_block_converter generic map(16) port map(temp_input,clk,load,output_bit);
end beh;
