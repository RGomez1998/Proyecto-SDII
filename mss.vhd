library ieee;
use ieee.std_logic_1164.all;

entity mss is
	port (clock, resetn, start, c1, c5, c10, c25, c50, dolar, no_valida, igual_a85ctvs, igual_a175ctvs, dos_seg, tres_seg, chocolate, fresa, 
			vainilla, menta, maracuya, yogurt, fruta, helado, topping, consulta, igual_diez, igual_uno	: in std_logic;
		   enC1, enC5, enC10, enC25, enC50, enDolar, moneda_rechazada, saldo_insuficiente, enRegSum, reset_RegSum, en_dos_seg, en_tres_seg, 
			resetn_contador_helado, en_reg_topping, resetn_contador_topping, selMux, en_cnt4, reset_cnt4, en_cntD, reset_cntD, en_ram, helado_listo, 
			compuerta																												: out std_logic);
end mss;
architecture comportamiento of mss is
	type estados is (S1,S2,S3,S4,A,S5,S6,B,S7,S8,C,S9,S10,D,S11,S12,E,S13,S14,F,S15,S16,G,S17,S18,H,S19,S20,S21,S22,S23,S24,I,S25,S26,J,S27,S28,K,S29,S30,L,S31,S32,M,S33,S34,S35,N,S36,S37,O,S38,S39,S40,P,S41,S42,Q,S43,S44,S45,S46,S47,S48,S49,S50,S51);
	signal y: estados;
begin
	process(clock, resetn)
	begin
		if resetn = '0' then y <= S1;
		elsif (clock'event and clock = '1') then
		case y is
			---   Start
			when 	S1 	=> if 	start 				= 	'1' 	then 	y 	<= S2;	else y <= S1;	end if;
			when 	S2 	=> if		start 				= 	'1' 	then 	y 	<= S2; 	else y <= S3; 	end if;
			
			
			---   Antirrebotes monedas
			when	S3		=>	if		C1						=	'1'	then	y	<= S4;
								elsif	C1						=	'0'	then 	y	<=	S5;	end if;
			when	S4		=>	if		C1						=	'1'	then	y	<=	S4;
								elsif	C1						=	'0'	then	y	<= A;	end if;
			when 	A		=>	y	<=	S19;
			
							
			when	S5		=>	if		C5						=	'1'	then	y	<= S6;
								elsif	C5						=	'0'	then 	y	<=	S7;	end if;
			when	S6		=>	if		C5						=	'1'	then	y	<=	S6;
								elsif	C5						=	'0'	then	y	<= B;	end if;
			when 	B		=>	y	<=	S19;
			
							
			when	S7		=>	if		C10					=	'1'	then	y	<= S8;
								elsif	C10					=	'0'	then 	y	<=	S9;	end if;
			when	S8		=>	if		C10					=	'1'	then	y	<=	S8;
								elsif	C10					=	'0'	then	y	<= C;	end if;
			when 	C		=>	y	<=	S19;				
							
							
			when	S9		=>	if		C25					=	'1'	then	y	<= S10;
								elsif	C25					=	'0'	then 	y	<=	S11;	end if;
			when	S10	=>	if		C25					=	'1'	then	y	<=	S10;
								elsif	C25					=	'0'	then	y	<= D;	end if;
			when 	D		=>	y	<=	S19;
			
			
			when	S11	=>	if		C50					=	'1'	then	y	<= S12;
								elsif	C50					=	'0'	then 	y	<=	S13;	end if;
			when	S12	=>	if		C50					=	'1'	then	y	<=	S12;
								elsif	C50					=	'0'	then	y	<= E;	end if;
			when 	E		=>	y	<=	S19;
			
							
			when	S13	=>	if		dolar					=	'1'	then	y	<= S14;
								elsif	dolar					=	'0'	then 	y	<=	S15;	end if;
			when	S14	=>	if		dolar					=	'1'	then	y	<=	S14;
								elsif	dolar					=	'0'	then	y	<= F;	end if;
			when 	F		=>	y	<=	S19;
							
							
			when	S15	=>	if		no_valida			=	'1'	then	y	<= S16;
								elsif	no_valida			=	'0'	then 	y	<=	S17;	end if;
			when	S16	=>	if		no_valida			=	'1'	then	y	<=	S16;
								elsif	no_valida			=	'0'	then	y	<= G;	end if;
			when 	G		=>	y	<=	S3;
			
							
			when	S17	=>	if		consulta				=	'1'	then	y	<= S18;
								elsif	consulta				=	'0'	then 	y	<=	S3;	end if;
			when	S18	=>	if		consulta				=	'1'	then	y	<=	S18;
								elsif	consulta				=	'0'	then	y	<= H;	end if;
			when 	H		=>	y	<=	S49;
					
					
			when 	S19	=>	y	<=	S20;

			
			---   Saldo completo
			when 	S20	=> if 	igual_a85ctvs 		= 	'1'	then 	y 	<= S22; 
								elsif igual_a85ctvs		= 	'0'	then 	y 	<= S21;	end if;
			
			when 	S21	=> if 	igual_a175ctvs 	= 	'1'	then 	y 	<= S22; 
								elsif igual_a175ctvs		= 	'0'	then 	y 	<= S3;	end if;
			
			when 	S22	=>	y	<=	S23;
			
			
			---	Antirrebotes sabores
			when	S23	=>	if		chocolate			=	'1'	then	y	<= S24;
								elsif	chocolate			=	'0'	then 	y	<=	S25;	end if;
			when	S24	=>	if		chocolate			=	'1'	then	y	<=	S24;
								elsif	chocolate			=	'0'	then	y	<= I;	end if;
			when 	I		=>	y	<=	S33; 	
			
								
			when	S25	=>	if		fresa					=	'1'	then	y	<= S26;
								elsif	fresa					=	'0'	then 	y	<=	S27;	end if;
			when	S26	=>	if		fresa					=	'1'	then	y	<=	S26;
								elsif	fresa					=	'0'	then	y	<= J;	end if;
			when 	J		=>	y	<=	S33;
								
								
			when	S27	=>	if		vainilla				=	'1'	then	y	<= S28;
								elsif	vainilla				=	'0'	then 	y	<=	S29;	end if;
			when	S28	=>	if		vainilla				=	'1'	then	y	<=	S28;
								elsif	vainilla				=	'0'	then	y	<= K;	end if;
			when 	K		=>	y	<=	S33;
								
								
			when	S29	=>	if		menta					=	'1'	then	y	<= S30;
								elsif	menta					=	'0'	then 	y	<=	S31;	end if;
			when	S30	=>	if		menta					=	'1'	then	y	<=	S30;
								elsif	menta					=	'0'	then	y	<= L;	end if;
			when 	L		=>	y	<=	S33;
								
								
			when	S31	=>	if		maracuya				=	'1'	then	y	<= S32;
								elsif	maracuya				=	'0'	then 	y	<=	S23;	end if;
			when	S32	=>	if		maracuya				=	'1'	then	y	<=	S32;
								elsif	maracuya				=	'0'	then	y	<= M;	end if;
			when 	M		=>	y	<=	S33;
			
			
			when 	S33	=>	y	<=	S34;

								
			---	Antirrebote tipo de helados					
			when	S34	=>	if		yogurt				=	'1'	then	y	<= S35;
								elsif	yogurt				=	'0'	then 	y	<=	S36;	end if;
			when	S35	=>	if		yogurt				=	'1'	then	y	<=	S35;
								elsif	yogurt				=	'0'	then	y	<= N;	end if;
			when 	N	=>		y	<= S38;
			
			
			when	S36	=>	if		fruta					=	'1'	then	y	<= S37;
								elsif	fruta					=	'0'	then 	y	<=	S34;	end if;
			when	S37	=>	if		fruta					=	'1'	then	y	<=	S37;
								elsif	fruta					=	'0'	then	y	<= O;	end if;
			when 	O	=>		y	<= S38;	
								
			
			when 	S38	=>	y	<=	S39;

			
			---	Antirrebote tiempo de topping			
			when	S39	=>	if		dos_seg				=	'1'	then	y	<= S40;
								elsif	dos_seg				=	'0'	then 	y	<=	S41;	end if;
			when	S40	=>	if		dos_seg				=	'1'	then	y	<=	S40;
								elsif	dos_seg				=	'0'	then	y	<= P;	end if;
			when 	P	=>		y	<= S43;
								
			when	S41	=>	if		tres_seg				=	'1'	then	y	<= S42;
								elsif	tres_seg				=	'0'	then 	y	<=	S39;	end if;
			when	S42	=>	if		tres_seg				=	'1'	then	y	<=	S42;
								elsif	tres_seg				=	'0'	then	y	<= Q;	end if;
			when 	Q	=>		y	<= S43;
			
			
			when 	S43	=>	y	<=	S44;
		
			--- Proceso de helado y topping
			when S44 	=> if		helado 				= 	'1' 	then 	y 	<= S45;
								else 	y <= S44;	end if;
			
							
			when S45		=> if		topping				= 	'1' 	then 	y 	<= S46;
								else 	y <= S45; 	end if;
								
			--- Proceso RAM
			when S46		=> if 	igual_diez			= 	'1'	then y 	<= S47; 
								else 	y	<=	S48;	end if;
			when S47		=> y	<= S3;
			when S48		=> y	<= S3;
		
			when S49		=>	if		igual_uno			= 	'1' 	then y 	<= S50;
								elsif	igual_uno			= 	'0' 	then y 	<= S51;	end if;
			when S50		=>	y	<= S49;
			when S51		=>	y	<= S3;
		end case;
	end if;
end process;


process(y)
	begin
enC1 <= '0'; enC5 <= '0'; enC10 <= '0'; enC25 <= '0'; enC50 <= '0'; enDolar <= '0'; enRegSum <= '0'; reset_RegSum <= '1'; 
moneda_rechazada <= '0'; saldo_insuficiente <= '0'; en_dos_seg <= '0'; en_tres_seg <= '0'; 
resetn_contador_helado <= '0'; en_reg_topping <= '0'; resetn_contador_topping <= '0'; 
selMux <= '0'; en_cnt4 <= '0'; en_cntD <= '0'; reset_cnt4 <= '1'; reset_cntD <= '1'; en_ram <= '0'; helado_listo <= '0'; compuerta <= '0';
			case y is
			When 	S1		=>	saldo_insuficiente 		<= '0'; 	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';
			When	S2		=>	saldo_insuficiente 		<= '0';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';
			
			When	S3		=>	saldo_insuficiente 		<= '1';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';
			When	S4		=>	saldo_insuficiente 		<= '1';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';
			When	A		=>	saldo_insuficiente 		<= '1';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';	enRegSum				<= '1';	enC1		<= '1';	

			
			When	S5		=>	saldo_insuficiente 		<= '1';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';
			When	S6		=>	saldo_insuficiente 		<= '1';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';
			When	B		=>	saldo_insuficiente 		<= '1';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';	enRegSum				<= '1';	enC5		<= '1';
			
			When	S7		=>	saldo_insuficiente 		<= '1';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';
			When	S8		=>	saldo_insuficiente 		<= '1';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';
			When	C		=>	saldo_insuficiente 		<= '1';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';	enRegSum				<= '1';	enC10		<= '1';
			
			When	S9		=>	saldo_insuficiente 		<= '1';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';
			When	S10	=>	saldo_insuficiente 		<= '1';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';
			When	D		=>	saldo_insuficiente 		<= '1';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';	enRegSum				<= '1';	enC25		<= '1';
			
			When	S11	=>	saldo_insuficiente 		<= '1';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';
			When	S12	=>	saldo_insuficiente 		<= '1';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';
			When	E		=>	saldo_insuficiente 		<= '1';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';	enRegSum				<= '1';	enC50		<= '1';
				
			When	S13	=>	saldo_insuficiente 		<= '1';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';
			When	S14	=>	saldo_insuficiente 		<= '1';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';
			When	F		=>	saldo_insuficiente 		<= '1';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';	enRegSum				<= '1';	enDolar	<= '1';
			
			When	S15	=>	saldo_insuficiente 		<= '1';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';
			When	S16	=>	saldo_insuficiente 		<= '1';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';
			When	G		=>	saldo_insuficiente 		<= '1';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';	moneda_rechazada 	<= '1';
			
			When	S17	=>	saldo_insuficiente 		<= '1';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';
			When	S18	=>	saldo_insuficiente 		<= '1';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';
			When	H		=>	saldo_insuficiente 		<= '1';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';	
			
			When	S19	=>	saldo_insuficiente 		<= '1';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';
			
			When	S20	=>	saldo_insuficiente 		<= '1';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';
			When	S21	=>	saldo_insuficiente 		<= '1';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';
			When	S22	=>	saldo_insuficiente 		<= '0';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';	en_ram   			<= '1';
			
			When	S23	=>	saldo_insuficiente 		<= '0';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';
			When	S24	=>	saldo_insuficiente 		<= '0';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';
			When	I		=>	saldo_insuficiente 		<= '0';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';
			
			When	S25	=>	saldo_insuficiente 		<= '0';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';
			When	S26	=>	saldo_insuficiente 		<= '0';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';
			When	J		=>	saldo_insuficiente 		<= '0';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';
			
			When	S27	=>	saldo_insuficiente 		<= '0';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';
			When	S28	=>	saldo_insuficiente 		<= '0';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';
			When	K		=>	saldo_insuficiente 		<= '0';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';
			
			When	S29	=>	saldo_insuficiente 		<= '0';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';
			When	S30	=>	saldo_insuficiente 		<= '0';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';
			When	L		=>	saldo_insuficiente 		<= '0';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';
			
			When	S31	=>	saldo_insuficiente 		<= '0';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';
			When	S32	=>	saldo_insuficiente 		<= '0';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';
			When	M		=>	saldo_insuficiente 		<= '0';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';
			
			When	S33	=> saldo_insuficiente 		<= '0';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';
			
			When	S34	=> saldo_insuficiente 		<= '0';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';
			When	S35	=> saldo_insuficiente 		<= '0';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';
			when 	N		=>	saldo_insuficiente 		<= '0';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';
			When	S36	=> saldo_insuficiente 		<= '0';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';
			When	S37	=> saldo_insuficiente 		<= '0';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';
			when 	O		=>	saldo_insuficiente 		<= '0';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';
			
			When	S38	=> saldo_insuficiente 		<= '0';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';
			
			When	S39	=> saldo_insuficiente 		<= '0';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';
			When	S40	=> saldo_insuficiente 		<= '0';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';
			when 	P		=>	saldo_insuficiente 		<= '0';	resetn_contador_helado	<= '0';	en_reg_topping 			<= '1';	en_dos_seg 					<= '1';  	
			
			When	S41	=> saldo_insuficiente 		<= '0';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';
			When	S42	=> saldo_insuficiente 		<= '0';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';
			when 	Q		=>	saldo_insuficiente 		<= '0';	resetn_contador_helado	<= '0';	en_reg_topping 			<= '1';	en_tres_seg 				<= '1';   
			
			When	S43	=> saldo_insuficiente 		<= '0';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';	
			
			When	S44	=>	saldo_insuficiente 		<= '0';	resetn_contador_helado	<= '1';	resetn_contador_topping <= '0';	

			When	S45	=>	saldo_insuficiente 		<= '0';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '1';
			When	S46	=>	saldo_insuficiente 		<= '0';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';	helado_listo 				<= '1';
			When	S47	=>	saldo_insuficiente 		<= '0';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';	reset_cnt4 					<= '0';
			When	S48	=>	saldo_insuficiente 		<= '0';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';	reset_RegSum 				<= '0';	compuerta 	<= '1';
			
			when S49		=>	saldo_insuficiente 		<= '1';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';
			when S50		=>	saldo_insuficiente 		<= '1';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';	reset_cntD 					<= '0';		
			when S51		=>	saldo_insuficiente 		<= '1';	resetn_contador_helado	<= '0';	resetn_contador_topping <= '0';	selMux 						<= '1'; 	en_cntD 		<= '1';
			when others => enC1 <= '0'; enC5 <= '0'; enC10 <= '0'; enC25 <= '0'; enC50 <= '0'; enDolar <= '0'; enRegSum <= '0'; reset_RegSum <= '1'; 
moneda_rechazada <= '0'; saldo_insuficiente <= '0'; en_dos_seg <= '0'; en_tres_seg <= '0'; 
resetn_contador_helado <= '0'; en_reg_topping <= '0'; resetn_contador_topping <= '0'; 
selMux <= '0'; en_cnt4 <= '0'; en_cntD <= '0'; reset_cnt4 <= '1'; reset_cntD <= '1'; en_ram <= '0'; helado_listo <= '0'; compuerta <= '0';
		end case;
	end process;
end comportamiento;