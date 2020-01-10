library ieee;
use ieee.std_logic_1164.all;
entity fsm_safe is 
	port( clk, resetn, ip : in std_logic;
			op	: out std_logic_vector(3 downto 0));
end fsm_safe;

architecture behavior of fsm_safe is 
	type state is (RESET, FALSE, UNLOCK, L1, L2, L3, L4, L5, L6);
	signal s: state;
begin

	process(resetn,clk)
	begin
		if resetn = '0' then
		s <= RESET;
		elsif RISING_EDGE(clk) then
			case s is
				when RESET =>
					if ip = '1' or ip = '0' then
					   s <= L1;
					end if;
				when L1 =>
					if ip = '1' then
						s <= L2;
					else
						s <= L1;
					end if;
				when L2 =>
					if ip = '1' then
						s <= L1;
					else
						s <= L3;
					end if;
				when L3 =>
					if ip = '1' then
						s <= L4;
					else
						s <= L1;
					end if;
				when L4 =>
					if ip = '1' then
						s <= L5;
					else
						s <= L6;
					end if;
				when L5 =>
					if ip = '1' then
						s <= FALSE;
					else
						s <= UNLOCK;
					end if;
				when L6 =>
					if ip = '1' or ip = '0' then
						s <= FALSE;
					end if;
				when FALSE =>
					if ip = '1' or ip = '0' then
						s <= L1;
					end if;
				when UNLOCK =>
					if ip = '1' or ip = '0' then
						s <= L1;
					end if;
			end case;
		  end if;
		end process;
	op <= "0000" WHEN s = RESET ELSE
	"0001" WHEN s = L1 ELSE
	"0011" WHEN s = L2 ELSE
	"0010" WHEN s = L3 ELSE
	"0110" WHEN s = L4 ELSE
	"0111" WHEN s = L5 ELSE
	"0101" WHEN s = L6 ELSE
	"0100" WHEN s = FALSE ELSE
	"1100" WHEN s = UNLOCK;
end behavior;
	
					
						
				
					