library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sd_tb is
end sd_tb;

architecture testbench of sd_tb is
	component sd
	port(
	     clk : in std_logic;
		reset : in std_logic;
		entra_moeda: out std_logic;
		a     : in std_logic_vector(7 downto 0);
		s     : in std_logic_vector(7 downto 0);-- valor do item
		soma  : out std_logic_vector(7 downto 0);
		c	   : in  std_logic;-- c habilitador de moeda
		d     : out std_logic
	);
	end component;
	
	signal clk : std_logic := '0';
	signal reset : std_logic := '1';
	signal c : std_logic:= '0' ;
	signal entra_moeda: std_logic;
	signal a : std_logic_vector(7 downto 0);
	signal soma  : std_logic_vector(7 downto 0);
	signal d : std_logic;
	signal s: std_logic_vector(7 downto 0):="10011101";
	
	type tipo_valores is array (0 to 7) of integer;
	constant valores : tipo_valores := (10, 5, 25, 50, 5, 10, 5, 25);
begin
	clk <= not clk after 10 ns;
	reset <= '0' after 100 ns;
	
	
	
	process(clk)
		variable i : integer := 0;
	begin
		if rising_edge(clk) and reset = '0' then
			a <= std_logic_vector(to_unsigned(valores(i), a'length));
				c <= '1';
			if entra_moeda = '1' then
				i := i + 1;
				c <= '0';
				if i = 8 then
					i := 0;
					
				end if;
			end if;
		end if;
	end process; 
	
	instancia : sd
	port map(
		clk => clk,
		reset => reset,
		entra_moeda=> entra_moeda,
		c => c,
		a => a,
		soma=>soma,
		s => s,
		d =>d
	);
end architecture;