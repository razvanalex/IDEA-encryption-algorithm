library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Multiply is
    Port (
        A : in std_logic_vector(15 downto 0);
        B : in std_logic_vector(15 downto 0);
        C : out std_logic_vector(15 downto 0)
    );
end Multiply;

architecture Behavioral of Multiply is
    signal result : std_logic_vector(31 downto 0);
    signal lo : std_logic_vector(15 downto 0);
    signal hi : std_logic_vector(15 downto 0);   
    
begin
    process (A, B, result, lo, hi) 
    begin
        result <= std_logic_vector(unsigned(A) * unsigned(B));
        if (result = x"00000000") then
            C <= std_logic_vector('1' - unsigned(A) - unsigned(B));
        else
            hi <= result(31 downto 16);
            lo <= result(15 downto 0);
            if (lo > hi) then
                C <= std_logic_vector(unsigned(lo) - unsigned(hi));
            else 
                C <= std_logic_vector(unsigned(lo) - unsigned(hi) + '1');
            end if;
        end if;
    end process;
end Behavioral;
