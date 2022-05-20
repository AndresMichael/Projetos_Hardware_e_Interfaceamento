LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY shift IS

	PORT (       a   : IN STD_LOGIC_VECTOR(3 DOWNTO 0) ;
				    Clk : IN STD_LOGIC ;
				    L   : IN STD_LOGIC ;
				    s   : BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0) 
	) ;
			
END ENTITY ;

ARCHITECTURE hard OF shift IS

BEGIN

	PROCESS 
	
		BEGIN
		
			WAIT UNTIL Clk'EVENT AND Clk = '1' ;
			IF L = '1' THEN 
				s <= a ;
				
			ELSE
				s(0) <= s(1) ;
				s(1) <= s(2);
				s(2) <= s(3) ;
				s(3) <= '0'; -- optei por zero mesmo
				
			END IF ;
	END PROCESS ;
END hard ;
		

		