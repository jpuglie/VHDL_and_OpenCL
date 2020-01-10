library ieee;
use ieee.std_logic_1164.all;
entity mux is
	generic( N: integer := 8);
	port (
		d : in std_logic_vector(N-1 downto 0);
		g : in std_logic_vector(N-1 downto 0);
		r0 : in std_logic_vector(N-1 downto 0);
		r1 : in std_logic_vector(N-1 downto 0);
		r2 : in std_logic_vector(N-1 downto 0);
		r3 : in std_logic_vector(N-1 downto 0);
		r4 : in std_logic_vector(N-1 downto 0);
		r5 : in std_logic_vector(N-1 downto 0);
		r6 : in std_logic_vector(N-1 downto 0);
		r7 : in std_logic_vector(N-1 downto 0);
		s : in std_logic_vector(9 downto 0);
		b : out std_logic_vector(N-1 downto 0));
end mux;

architecture behavior of mux is

begin
	
	with s select b <=
		d when "0000000001",
		g when "0000000010",
		r0 when "0000000100",
		r1 when "0000001000",
		r2 when "0000010000",
		r3 when "0000100000",
		r4 when "0001000000",
		r5 when "0010000000",
		r6 when "0100000000",
		r7 when "1000000000",
		d when others;

end behavior;
	