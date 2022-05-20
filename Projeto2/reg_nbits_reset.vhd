LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY reg_nbits_reset IS
	GENERIC (
		n : integer := 4
	);
	PORT (
		clk   : IN STD_LOGIC;
		reset : IN STD_LOGIC;
		a     : IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
		s     : OUT STD_LOGIC_VECTOR (n-1 DOWNTO 0)
	);
END reg_nbits_reset;

ARCHITECTURE comportamento OF reg_nbits_reset IS
 
BEGIN

--	rst_assincrono: PROCESS(clk)
--	BEGIN
--		IF reset = '1' THEN
--			r <= (OTHERS => '0');
--		elsIF rising_edge(clk) THEN
--			r <= d;
--		END IF;
--	END PROCESS;
	
	rst_sincrono: PROCESS(clk)
		
	BEGIN
		IF rising_edge(clk) THEN
			IF reset = '1' THEN
				s <= (OTHERS => '0');
			else
				s <= a;
			end if;
		END IF;
	END PROCESS;
	
END comportamento;