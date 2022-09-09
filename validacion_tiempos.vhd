--Library
library ieee;
use ieee.std_logic_1164.all;

entity validacion_tiempos is
generic ( n: integer :=8);--<------- nbits 
port (dos_seg, tres_seg: in std_logic;
		tiempo: out std_logic_vector(n-1 downto 0));
end validacion_tiempos;

architecture solve of validacion_tiempos is
begin
process(dos_seg, tres_seg)
begin
tiempo <= "00000000";
		
	if dos_seg = 		'1' then tiempo <= "00000010"; end if; 
		
	if tres_seg = 		'1' then tiempo <= "00000011"; end if; 
		
end process;	
end solve;