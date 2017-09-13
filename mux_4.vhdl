-- Entity: mux_4
-- Architecture: Structural
-- Created on: 09/18/2016
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity mux_4 is
	port (
		P: in std_logic;
		Q: in std_logic;
		R: in std_logic;
		T: in std_logic;
		S0: in std_logic;
		S1: in std_logic;
		Y: out std_logic);
end mux_4;

architecture structural of mux_4 is

component mux2
	port (
		P: in std_logic;
		Q: in std_logic;
		S: in std_logic;
		Y: out std_logic);
end component;

signal t1,t2: std_logic;

begin

U1: mux2 port map (P, Q, S0, t2);
U2: mux2 port map (R, T, S0, t1);

U3: mux2 port map (t2, t1, S1, Y);

end structural;