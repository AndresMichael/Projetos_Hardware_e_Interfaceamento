library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity bc is
	port(
		--a : in std_logic_vector(7 downto 0);-- moeda
		s : in std_logic_vector(7 downto 0);-- valor do item
		entra_moeda: out std_logic;
		clk, reset, c	: in  std_logic;-- c habilitador de moeda
		cac, rac : out std_logic;-- cac(cacula) , rac(reseta acumulador)
		acum  : in std_logic_vector(7 downto 0);-- (sinal de acumulação das moedas)
		d    : out std_logic -- dispara 1 bit quando o preço s é atendido
	);
end bc;

architecture comportamento of bc is

	type tipo_estado is (S0, S1, S2, S3, s4);
	signal prox_estado, estado : tipo_estado := S0;
	
begin
	
	logica_proximo_estado : process(estado, c, acum)
	
	begin
		case estado is
			when S0 =>
				if c = '0' then
					prox_estado <= S0;
				else
					prox_estado <= S1;
				end if;
			when S1 => 
				if c = '0' then
					prox_estado <= S1;
					
				elsif c = '1' and acum < s then
					prox_estado <= S2;
					
				elsif acum >= s then
					prox_estado <= s3;
					
				end if;
			when S2 =>
				prox_estado <= S1;
			when S3 =>
				prox_estado <= S4;
			when S4 =>
				prox_estado <= S0;
		end case;
	end process;
	
	registrador_estado : process(clk, reset)
	begin
		if reset = '1' then
			estado <= S0;
		elsif rising_edge(clk) then
			estado <= prox_estado;
		end if;
	end process;
	
	-- Circuito combinacional -> não depende de clock
	logica_saida : process(estado)
	begin
		case estado is
			when S0 =>
				cac <= '0';
				rac <= '1';
				d   <= '0';
				entra_moeda <= '0';
			when S1 =>
				cac <= '0';
				rac <= '0';
				d   <= '0';
				entra_moeda <= '0';
			when S2 =>
				cac <= '1';
				rac <= '0';
				d   <= '0';
				entra_moeda <= '1';
			when S3 =>
				cac <= '0';
				rac <= '0';
				d   <= '0';
				entra_moeda <= '0';
			when s4 =>
				cac <= '0';
				rac <= '0';
				d   <= '1';
				entra_moeda <= '0';
		end case;
	end process;
	
end architecture;