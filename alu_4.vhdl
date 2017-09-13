-- Entity: alu_4
-- Architecture: Structural
-- Created on: 09/18/2016
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity alu_4 is
	port (
		A: in std_logic_vector(3 downto 0);
		B: in std_logic_vector(3 downto 0);
		Cin: in std_logic;
		S1: in std_logic;
		S0: in std_logic;
		G: out std_logic_vector(3 downto 0);
		Cout: out std_logic);
end alu_4;

architecture structural of alu_4 is

component tielow
port (	
	tilow: out std_logic_vector(3 downto 0));
end component;

component tiehigh
port (
	tihigh: out std_logic_vector(3 downto 0));
end component;

component inverter
	port (
		input7 : in std_logic;
		output7 : out std_logic);
end component;

component mux_4
	port (
		P: in std_logic;
		Q: in std_logic;
		R: in std_logic;
		T: in std_logic;
		S0: in std_logic;
		S1: in std_logic;
		Y: out std_logic);
end component;

component adder4
  port (
    input1   : in  std_logic_vector(3 downto 0);
    input2   : in  std_logic_vector(3 downto 0);
    carryin  : in  std_logic;
    sum      : out std_logic_vector(3 downto 0);
    carryout : out std_logic);
end component;

for mux4_1, mux4_2, mux4_3, mux4_4 : mux_4 use entity work.mux_4(structural);

for adder4_1: adder4 use entity work.adder4(structural);
for inverter_1, inverter_2, inverter_3, inverter_4: inverter use entity work.inverter(structural);
for tielow_1: tielow use entity work.tielow(structural);
for tiehigh_1: tiehigh use entity work.tiehigh(structural);

signal Y_temp: std_logic_vector(3 downto 0);
signal Inv_temp: std_logic_vector(3 downto 0);
signal tilow_1: std_logic_vector(3 downto 0);
signal tihigh_1: std_logic_vector(3 downto 0);

begin

inverter_1: inverter port map (B(0), Inv_temp(0));
inverter_2: inverter port map (B(1), Inv_temp(1));
inverter_3: inverter port map (B(2), Inv_temp(2));
inverter_4: inverter port map (B(3), Inv_temp(3));

tielow_1: tielow port map (tilow_1);
tiehigh_1: tiehigh port map (tihigh_1);

mux4_1: mux_4 port map (tilow_1(0), B(0), Inv_temp(0), tihigh_1(0), S1, S0, Y_temp(0));
mux4_2: mux_4 port map (tilow_1(1), B(1), Inv_temp(1), tihigh_1(1), S1, S0, Y_temp(1));
mux4_3: mux_4 port map (tilow_1(2), B(2), Inv_temp(2), tihigh_1(2), S1, S0, Y_temp(2));
mux4_4: mux_4 port map (tilow_1(3), B(3), Inv_temp(3), tihigh_1(3), S1, S0, Y_temp(3));

adder4_1: adder4 port map (A, Y_temp, Cin, G, Cout);

end structural;
