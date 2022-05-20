library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity main is 

	generic( n : integer := 4);
	
	port(
		  a, b       : in std_logic_vector(n-1 downto 0);
		  sel        : in natural range 0 to 4;
		  clk, reset : IN STD_LOGIC;
		  L          : IN STD_LOGIC;
		  saida		 : out std_logic_vector(n-1 downto 0)
	);
end entity;

architecture hard of main is

		signal c1, c2, c3, c4, c5, c6: std_logic_vector(n-1 downto 0);
--------------------------------------------------------------------------
		component multiplex 
		
		generic ( n : integer := 4); --numero de bits
		port(
				a,b,c,d,e : in std_logic_vector(n-1 downto 0);
				sel 		 : in natural range 0 to 4;
				saida     : out std_logic_vector(n-1 downto 0)
		);
		end component;
-----------------------------------------------------------------------	
		component porta_and 
	
		generic ( n : integer := 4);
		port(
				a ,b : in std_logic_vector(n-1 downto 0);
				z	  :   out std_logic_vector(n-1 downto 0)
		);
		end component;
------------------------------------------------------------------------
		component porta_or 

		generic ( n : integer := 4);
		port(
				a ,b : in std_logic_vector(n-1 downto 0);
				z	  :   out std_logic_vector(n-1 downto 0)
		);
	
		end component;
-------------------------------------------------------------------------
		component subtrator 
		
		generic( n : natural := 4);
		port(
			   a,b : in  std_logic_vector(n-1 downto 0);
				sub : out std_logic_vector(n-1 downto 0)
		);
		end component;
-------------------------------------------------------------------------
		component reg_nbits_reset 
		GENERIC (
		n : integer := 4
		);
		PORT (
			clk   : IN STD_LOGIC;
			reset : IN STD_LOGIC;
			a     : IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
			s     : OUT STD_LOGIC_VECTOR (n-1 DOWNTO 0)
		);
		END component;
----------------------------------------------------------------------------
		component shift 

		PORT (    
				a   : IN STD_LOGIC_VECTOR(3 DOWNTO 0) ;
			   Clk : IN STD_LOGIC ;
			   L   : IN STD_LOGIC ;
				s   : BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0) 
		) ;
			
		END component ;
---------------------------------------------------------------------------
		component somador is 
	   generic ( n   : integer := 4);
	
	   port(
			a,b : in  std_logic_vector(n-1 downto 0);
				soma : out std_logic_vector(n-1 downto 0)
	   );

      end component;
----------------------------------------------------------------------------

begin
		sum : somador
		generic map( n => n)
		port map(
			a => a,
			b => b,
			soma => c1
		);
		
		
		mux : multiplex
		generic map( n => n)
		port map(
			a => c1,
			b => c2,
			c => c3,
			d => c4,
			e => c5,
			saida => c6,
			sel => sel
		);
		
		
		sub : subtrator
		generic map( n => n)
		port map(
			a => a,
			b => b,
			sub => c2
		);
		

		p_or : porta_or
		generic map( n => n)
		port map(
			a => a,
			b => b,
			z => c3
		);
		
		
		p_and : porta_and
		generic map( n => n)
		port map(
			a => a,
			b => b,
			z => c4
		);
		
		
		reg : reg_nbits_reset
		generic map( n => n)
		port map(
			clk => clk,
			reset => reset,
			a => c6,
			s => saida
		);
		
		
		shif : shift
			port map(
			L => L,  -- habilitador
			clk => clk,
			a => a,
			s => c5
			);
		
end hard;
