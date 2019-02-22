library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity AddMod16 is
 Port (
       A : in std_logic_vector(15 downto 0);
       B : in std_logic_vector(15 downto 0);
       C : out std_logic_vector(15 downto 0)
   );
end AddMod16;

architecture Behavioral of AddMod16 is
begin
    C <= std_logic_vector(unsigned(A) + unsigned(B));
end Behavioral;
