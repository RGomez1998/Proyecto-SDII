--Counter up
--https://github.com/VHDL-Digital-Systems
--http://blog.espol.edu.ec/sistemasdigitalesfiec

--Library
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

--Entity
entity Cnt_Ld8 is
	generic ( n: integer :=8);--<------- nbits
	port(
		Clk,resetn,en: in std_logic;
		q: buffer std_logic_vector(n-1 downto 0));
end Cnt_Ld8;

--Architecture
architecture solve of Cnt_Ld8 is
	-- Signals,Constants,Variables,Components
	begin
	--Process #1
	process(resetn,clk)
	--Sequential programming
		begin
			if resetn='0' then
				q <= "00000000";
			elsif clk'event and clk='1' then
				if en='1' then q<=q+1;
				end if;
			end if;
	end process;
	--Process #n...
end solve;