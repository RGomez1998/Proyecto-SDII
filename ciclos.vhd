--Library
library ieee;
use ieee.std_logic_1164.all;

entity ciclos is
generic ( n: integer :=4);--<------- nbits 
port (cero_grados, un_grado, dos_grados, tres_grados, cuatro_grados, mayor_cuatro_grados: in std_logic;
		ciclo: out std_logic_vector(n-1 downto 0));
end ciclos;

architecture solve of ciclos is
begin
process(cero_grados, un_grado, dos_grados, tres_grados, cuatro_grados, mayor_cuatro_grados)
begin
ciclo <= "0000";
	if cero_grados 		= 		'1' then ciclo <= "0000"; end if; 
		
	if un_grado 			= 		'1' then ciclo <= "0010"; end if; 
		
	if dos_grados 			= 		'1' then ciclo <= "0100"; end if; 
	
	if tres_grados 		= 		'1' then ciclo <= "0110"; end if; 
		
	if cuatro_grados 		=	 	'1' then ciclo <= "1000"; end if; 
		
	if mayor_cuatro_grados 		= 		'1' then ciclo <= "1010"; end if;
	
end process;	
end solve;