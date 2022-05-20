LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY main IS
		PORT
		(     ck, ckdez, ckcen : IN STD_LOGIC;
				hex0 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
				hex1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
				hex2 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0) 
		);
		
END ENTITY;

ARCHITECTURE contagem OF main IS

	COMPONENT conta
		PORT(	
		      ckin  : IN STD_LOGIC;
				ckout : OUT STD_LOGIC;
				vcont : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
		);

	END COMPONENT;
	
	COMPONENT disp7
		PORT(	
		      dec  : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
				disp : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
		);
	END COMPONENT;
	
	SIGNAL ckdez_sinal : STD_LOGIC:='0';
	SIGNAL ckcen_sinal : STD_LOGIC:='0';						-- possivel erro
	
	SIGNAL cen : STD_LOGIC_VECTOR(3 DOWNTO 0):= "0000";-- outro possivel erro
	SIGNAL dez : STD_LOGIC_VECTOR(3 DOWNTO 0):= "0000";
	SIGNAL uni : STD_LOGIC_VECTOR(3 DOWNTO 0);
	
BEGIN
	
	

	conta_uni : conta
	PORT MAP(
	    ckin => ck,
		ckout => ckdez_sinal,
		vcont => uni);
	
	conta_dez : conta
	PORT MAP(
	    ckin => ckdez,
		ckout => ckcen_sinal,
		vcont => dez);
		
	conta_cen : conta
	PORT MAP(
	   ckin => ckcen,
		vcont => cen);
	
	disp_uni : disp7
	PORT MAP(
	    dec => uni,
		disp => hex0);
	
	disp_dez : disp7
	PORT MAP(
	    dec => dez,
		disp => hex1);
		
	disp_cen : disp7
	PORT MAP(
	    dec => cen,
		 disp => hex2);
END contagem;