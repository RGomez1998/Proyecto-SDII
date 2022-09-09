--Adder of 2 number of n bits
--https://github.com/VHDL-Digital-Systems
--http://blog.espol.edu.ec/sistemasdigitalesfiec

--Adder of 2 number of n bits
--https://github.com/VHDL-Digital-Systems
--http://blog.espol.edu.ec/sistemasdigitalesfiec

--Library
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

--Entity
entity restador4 is
	generic ( n: integer :=4);--<------- nbits
	port(
		X,Y:in std_logic_vector(n-1 downto 0);
		S: out std_logic_vector(n-1 downto 0));
end restador4;

--Architecture
architecture solve of restador4 is
	-- Signals,Constants,Variables,Components
	begin
		S<=x-y;--Without the sign bit--s<='0'&(x+y);--with sign bit
end solve;

