-- Ripple Carry Adder using Full Adder
LIBRARY ieee;
USE ieee.std_logic_1164.all;
entity ripple_carry_adder is
	generic( N : integer := 8);
	port(c_in: in std_logic;
		  a : in std_logic_vector(N-1 downto 0);
		  b : in std_logic_vector(N-1 downto 0);
		  c_out: out std_logic;
		  s : out std_logic_vector(N-1 downto 0));
end ripple_carry_adder;
-----------------------------------------------------
architecture behavior of ripple_carry_adder is

		component full_adder
			port( c_in : in std_logic;
					a	: in std_logic;
					b	: in std_logic ;
					c_out	: out std_logic;
					s	: out std_logic);
		end component full_adder;

		signal carry_sig: std_logic_vector(N-1 downto 0);
begin
	ripple_carry: for i in 1 to N generate
	begin
		first_adder: if i = 1 generate
		begin
				adder: component full_adder
						port map(c_in,a(i-1),b(i-1),carry_sig(i-1), s(i-1));
		end generate first_adder;
		middle_adders: if ((i>1) and (i<N)) generate
		begin
				adder: component full_adder
						port map(carry_sig(i-2),a(i-1),b(i-1),carry_sig(i-1), s(i-1));
		end generate middle_adders;
		final_adder: if i = N generate
		begin
				adder: component full_adder
						port map(carry_sig(i-2),a(i-1),b(i-1), c_out, s(i-1));
		end generate final_adder;
	end generate ripple_carry;
end architecture;
