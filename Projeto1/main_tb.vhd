LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY main_tb is
END main_tb;

ARCHITECTURE hard OF main_tb IS

	COMPONENT main IS
		PORT
		(     ck, ckdez, ckcen : IN STD_LOGIC;
				hex0 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
				hex1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
				hex2 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0) 
		);
	END COMPONENT;
		signal ck, ckdez, ckcen : std_logic := '0';
		
		signal hex0, hex1, hex2 : STD_LOGIC_VECTOR(6 DOWNTO 0) ;
begin
		main1 : main 
		port map(
		hex0 => hex0,
		hex1 => hex1,
		hex2 => hex2,
		ck => ck,
		ckdez => ckdez,
		ckcen => ckcen
		);
		
		ck <= not ck after 10 ns;
		ckdez <= not ckdez after 100 ns;
		ckcen <= not ckcen after 1000 ns;
		
END hard;