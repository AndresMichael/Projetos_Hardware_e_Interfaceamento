library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bo is
	port(
		a   : in std_logic_vector(7 downto 0);
		clk : in std_logic;
		cac, rac : in std_logic;
		soma : out std_logic_vector(7 downto 0);
		acum : out std_logic_vector(7 downto 0)
		
		
	);
end bo;

architecture comportamento of bo is
	signal soma_out : std_logic_vector(7 downto 0);
	signal acum_out : std_logic_vector(7 downto 0);
	
begin
	acumulador : process(clk)
	begin
		if rising_edge(clk) then
			if rac = '1' then
				acum_out <= (others => '0');
			elsif cac = '1' then
				acum_out <= soma_out;
			end if;
		end if;
	end process;
	
	
	
	
	soma_out <= std_logic_vector(unsigned(acum_out) + unsigned(a));
	
	acum <= acum_out;
	soma <= acum_out;
	
	
end architecture;