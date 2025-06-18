library IEEE;
use IEEE.std_logic_1164.all;

entity PEnc4_2 is
  port (decodedIn : in std_logic_vector(3 downto 0);
        encodedOut : out std_logic_vector(1 downto 0);
        validOut : out std_logic);
end PENc4_2;

architecture Behavioral of PEnc4_2 is
begin
  process(decodedIn)
  begin
    if decodedIn = "1000" then
	 	encodedOut <= "00";
	 	validOut <= '1';
	 elsif decodedIn(2 downto 0) = "100" then
	 	encodedOut <= "01";
	 	validOut <= '1';
	 elsif decodedIn(1 downto 0) = "10" then
	 	encodedOut <= "10";
	 	validOut <= '1';
	 elsif decodedIn(0) = '1' then
	 	encodedOut <= "11";
	 	validOut <= '1';
	 else
		encodedOut <= "XX";
	 	validOut <= '0';
	 end if;
  end process;
end Behavioral;
