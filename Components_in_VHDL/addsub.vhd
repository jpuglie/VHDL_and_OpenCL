--Adder/Subtractor using a Ripple Carry Adder component
library ieee;
use ieee.std_logic_1164.all;
entity addsub is
	generic(N : integer := 8);
	port(
		sign : in std_logic; --Determines whether to add or subtract
		a : in std_logic_vector(N-1 downto 0);
		b : in std_logic_vector(N-1 downto 0);
		op : out std_logic_vector(N-1 downto 0));
end addsub;

architecture mixed of addsub is

component ripple_carry_adder is
	generic(N : integer);
	port(c_in: in std_logic;
		  a : in std_logic_vector(N-1 downto 0);
		  b : in std_logic_vector(N-1 downto 0);
		  c_out: out std_logic;
		  s : out std_logic_vector(N-1 downto 0));
end component ripple_carry_adder;

signal b_sig : std_logic_vector(N-1 downto 0);
signal c_sig : std_logic;

begin

process(a,b,sign)
begin
	case sign is
		when '1' =>
			b_sig <= NOT b;
		when others =>
			b_sig <= b;
	end case;
		
end process;

		adder_subtractor: ripple_carry_adder 
		   generic map (N => 8)
			port map(sign,a,b_sig,c_sig,op);

end mixed;
			
		
		
