--Library
library ieee;
use ieee.std_logic_1164.all;

entity validacion is
generic ( n: integer :=8);--<------- nbits 
port (un_cntv, cinco_ctvs, diez_ctvs, veinti_ctvs, cincuenta_ctvs, unDolar: in std_logic;
		moneda: out std_logic_vector(n-1 downto 0));
end validacion;

architecture solve of validacion is
begin
process(un_cntv, cinco_ctvs, diez_ctvs, veinti_ctvs, cincuenta_ctvs, unDolar)
begin
moneda <= "00000000";
	if un_cntv = 				'1' then moneda <= "00000001"; end if; 
		
	if cinco_ctvs = 			'1' then moneda <= "00000101"; end if; 
		
	if diez_ctvs = 			'1' then moneda <= "00001010"; end if; 
		
	if veinti_ctvs = 			'1' then moneda <= "00011001"; end if; 
		
	if cincuenta_ctvs =	 	'1' then moneda <= "00110010"; end if; 
		
	if unDolar = 				'1' then moneda <= "01100100"; end if; 
end process;	
end solve;