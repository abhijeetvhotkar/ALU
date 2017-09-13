-- Entity: transfer
-- Architecture: Structural
-- Created on: 09/18/2016
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity transfer is
port (	B: in std_logic;
	o: out std_logic);
end transfer;

architecture structural of transfer is

begin

O <= B;

end structural;
