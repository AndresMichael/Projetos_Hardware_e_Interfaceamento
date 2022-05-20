library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity subtrator is 
	generic( n : natural := 4);
	
	port(
			   a,b : in  std_logic_vector(n-1 downto 0);
				sub : out std_logic_vector(n-1 downto 0)
	);
end subtrator;

architecture hard of subtrator is
	
	signal sub_sig: signed(n-1 downto 0);
	
begin

	-- convert para signed e faz a conta
	sub_sig <= signed(a) - signed(b);
	
	-- convete para std_logic
	sub <= std_logic_vector(sub_sig);
	
end hard;