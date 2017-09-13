-- Entity: alu_4_test 
-- Architecture : test 
-- Created On: 09/19/2016
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity alu_4_test is

end alu_4_test;

architecture test of alu_4_test is

component alu_4
  port (
		A: in std_logic_vector(3 downto 0);
		B: in std_logic_vector(3 downto 0);
		Cin: in std_logic;
		S0: in std_logic;
		S1: in std_logic;
		G: out std_logic_vector(3 downto 0);
		Cout: out std_logic);
end component;

for alu_4_1 : alu_4 use entity work.alu_4(structural);
   signal ip1, ip2, op: std_logic_vector(3 downto 0);
   signal sel_1, sel_2, cinp, cout: std_logic;
   signal clock : std_logic;
begin

alu_4_1 : alu_4 port map (ip1, ip2, cinp, sel_1, sel_2, op, cout);
clk : process
   begin  -- process clk

    clock<='0','1' after 10 ns;
    wait for 20 ns;

  end process clk;

io_process: process

  file infile  : text is in "alu_4_in.txt";
  file outfile : text is out "alu_4_out.txt";
  variable i1, i2, op1 : std_logic_vector(3 downto 0);
  variable ci, co, sel_1_1, sel_2_1: std_logic;
  variable buf : line;

begin

  while not (endfile(infile)) loop


	readline(infile,buf);
	read (buf,i1);
	ip1<=i1;

	readline(infile,buf);
	read (buf,i2);
	ip2<=i2;
	
	readline(infile,buf);
	read (buf,ci);
	cinp<=ci;

	readline(infile,buf);
	read (buf, sel_1_1);
	sel_1<=sel_1_1;

	readline(infile,buf);
	read (buf, sel_2_1);
	sel_2<=sel_2_1;
	
    

    wait until falling_edge(clock);

    op1:=op;
    co:=cout;

    write(buf,op1);
    writeline(outfile,buf);

    write(buf,co);
    writeline(outfile,buf);

  end loop;

end process io_process;

end test;
