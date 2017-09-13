-- Entity: mux2
-- Architecture: Structural
-- Created on: 09/18/2016
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity mux2 is
	port (
		P: in std_logic;
		Q: in std_logic;
		S: in std_logic;
		Y: out std_logic);
end mux2;

architecture structural of mux2 is

begin

Y <= ((not S) and P) or (S and Q);

end structural;
