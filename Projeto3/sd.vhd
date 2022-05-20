library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sd is
	port(
		clk : in std_logic;
		reset : in std_logic;
		a   : in std_logic_vector(7 downto 0);
		entra_moeda: out std_logic;
		s : in std_logic_vector(7 downto 0);-- valor do item
		soma: out std_logic_vector(7 downto 0);
		c	: in  std_logic;-- c habilitador de moeda
		d    : out std_logic
		
	);
end sd;

architecture estrutura of sd is
	
	component bc is
	   port(
		     
		     s : in std_logic_vector(7 downto 0);-- valor do item
			  entra_moeda: out std_logic;
		     clk, reset, c	: in  std_logic;-- c habilitador de moeda
		     cac, rac : out std_logic;-- cac(cacula) , rac(reseta acumulador)
		     acum  : in std_logic_vector(7 downto 0);
		     d    : out std_logic
	   );
	end component;
	
	component bo is
		port(
			a   : in std_logic_vector(7 downto 0);
			clk : in std_logic;
			cac, rac : in std_logic;
			soma : out std_logic_vector(7 downto 0);
			acum : out std_logic_vector(7 downto 0)
		
		
		);
	end component;
	
	signal cac, rac : std_logic;
	signal acum: std_logic_vector(7 downto 0);
begin
	fsm : bc
	port map(
	   s => s,
		c => c,
		entra_moeda => entra_moeda,
		clk => clk, 
		reset => reset, 
		cac => cac,
		rac => rac,
		acum => acum, 
		d => d
		
	);
	
	datapath : bo
	port map(
		a =>a,
		clk => clk,
		cac => cac,
		rac => rac,
		soma => soma,
		acum => acum
		
	);
	
end architecture;