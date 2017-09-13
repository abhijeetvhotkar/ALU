-- Entity: tielow
-- Architecture: Structural
-- Created on: 09/18/2016
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity tielow is
port (	
	tilow: out std_logic_vector(3 downto 0));
end tielow;

architecture structural of tielow is

	begin
	tilow <= "0000";
	
end structural;
