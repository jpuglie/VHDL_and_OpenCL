library ieee;
use ieee.std_logic_1164.all;
entity fsm_safe_board is 
	port( SW : in std_logic_vector(9 downto 0);
			KEY : in std_logic_vector(3 downto 0);
			LEDR : out std_logic_vector(9 downto 0));
end fsm_safe_board;
			
architecture structure of fsm_safe_board is

	component fsm_safe is
		port( clk, resetn, ip : in std_logic;
			op	: out std_logic_vector(3 downto 0));
		end component fsm_safe;
		
	begin
	
	hardware : component fsm_safe
		port map(KEY(0), SW(1), SW(0), LEDR(3 downto 0));
end structure;
