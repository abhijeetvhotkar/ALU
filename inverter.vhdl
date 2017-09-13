-- Entity: Inverter
-- Architecture: Structural
-- Created on: 09/18/2016
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity inverter is
	port (
		input7 : in std_logic;
		output7: out std_logic);
end inverter;

architecture structural of inverter is

begin
      output7 <= not input7;
end structural;
