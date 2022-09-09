library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity pwm is
	generic	(
				max_val: 	integer := 100;
				val_bits: 	integer := 4
				);
	
	port 		(
				clck: 	in 	std_logic;
				clr :		in 	std_logic;
				val_cur: in 	std_logic_vector((val_bits - 1) downto 0);
				pulse: 	out 	std_logic
				);
end pwm;

architecture simulacion of pwm is
signal cnt: std_logic_vector((val_bits - 1) downto 0);

begin 
process(clck)
begin
	if clr = '1' then
            cnt <= "0000";
	elsif (clck'event and clck = '1') then
		if (cnt 	< (max_val -1)) then
						cnt <= cnt+1;
		else 
						cnt <= (others => '0');
		
		end if;
	end if;
end process;

process(clck)
begin
	if (clck'event and clck = '1') then
		if (val_cur > cnt) then
						pulse <= '1';
		else 
						pulse <= '0';
		
		end if;
	end if;
end process;
end simulacion;