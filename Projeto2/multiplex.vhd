Library ieee;
use ieee.std_logic_1164.all;

entity multiplex is 
	generic ( n : integer := 4); --numero de bits
	

	port(
			a,b,c,d,e : in std_logic_vector(n-1 downto 0);
			sel 		 : in natural range 0 to 4;
			saida     : out std_logic_vector(n-1 downto 0)
	
	);
end entity;

architecture hard of multiplex is 

begin
	saida <= a when sel=0 else
				b when sel=1 else
				c when sel=2 else
				d when sel=3 else
				e ;
				
end hard;
				