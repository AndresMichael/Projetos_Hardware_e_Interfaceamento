Library ieee;
use ieee.std_logic_1164.all;

entity porta_or is

	generic ( n : integer := 4);
	
	port(
	a ,b : in std_logic_vector(n-1 downto 0);
	z	  :   out std_logic_vector(n-1 downto 0)
	
	);
	
end entity;

architecture hard of porta_or is

begin
  z <= a or b;
  
 end hard;