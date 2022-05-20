library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

entity main_tb is -- caracteristica do testbench
end entity;

architecture hard of main_tb is
	
	signal sinal_a, sinal_b : std_logic_vector(3 downto 0) := "0000";
	signal saida : std_logic_vector(3 downto 0) := "0000";

	type meu_array is array( 0 to 15) of std_logic_vector(3 downto 0);
	
	constant array_a: meu_array:= (
	
	"0010","1000","0110","0111",
	"1000","0101","1111","0111",
	"1000","1001","1011","1011",
	"1100","1101","0110","1111");
	
	constant array_b: meu_array:= (
	
	"0001","0001","0010","0011",
	"0100","0101","0110","0011",
	"0000","0001","1000","0011",
	"1100","1001","0010","0001");
	
	
   COMPONENT main
	generic( n : integer := 4);
	
	port(
	     
		  a, b       : in std_logic_vector(n-1 downto 0);
		  sel        : in natural range 0 to 4;
		  clk, reset : IN STD_LOGIC;
		  L          : IN STD_LOGIC;
		  saida	     : out std_logic_vector(n-1 downto 0)
	);
	end component;
	
	signal clk : std_logic := '0';
	signal L   : STD_LOGIC:= '1' ;
	signal sel        : natural := 0;
begin

    -- processo para ler os arrays 
	process(clk)
		variable i : integer := 0;
	begin
		if falling_edge(clk) then
			sinal_a <= array_a(i);
			sinal_b <= array_b(i);
			i := i + 1;
			
			if i = 16 then
				i := 0;
			end if;
		end if;
	end process;
	
	-- processo para mudança do sel(select)
	process(clk)
		variable i : integer := 0;
	begin
		if rising_edge(clk) then
			i := i + 1;
			if i = 10 then
				i := 0;
				sel <= sel + 1;
				if sel = 4 then
					sel <= 0;
				end if;
			end if;
		end if;
	end process;
	
	
	salva_dados : PROCESS(clk)
		file arquivo : text open write_mode is "C:\Users\Michael Andre\Documents\PHI_Roteiro2_completo\teste2.txt";
		Variable linha : line;
		Variable dado1 : integer;
		
	BEGIN
		IF rising_edge(clk) THEN
			dado1 := to_integer(unsigned(saida));
			
			write(linha, dado1);
		   writeline(arquivo, linha);
		END IF;
	END PROCESS;
	
		
	-- é a instanciação do main e as conex~es com os sinais(fios) do testbench(main_tb)
	main1 : main 
		port map(
		a => sinal_a,
		b => sinal_b,
		saida => saida,
		clk => clk,
		reset => '0',
		L => L,
		sel => sel
		);
		
		
	-- o clock ta sendo gerado a cada 5 ns ( 5 de descida e 5 de subida)
	
	clk <= not clk after 5 ns;
	L   <= not L after   400 ns;
	
end hard;
