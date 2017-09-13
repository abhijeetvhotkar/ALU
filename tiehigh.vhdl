-- Entity: tiehigh
-- Architecture: Structural
-- Created on: 09/18/2016
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity tiehigh is
port (tihigh: out std_logic_vector(3 downto 0));
end tiehigh;

architecture structural of tiehigh is

	begin
	tihigh <= "1111";
end structural;
