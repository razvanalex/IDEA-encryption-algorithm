library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiply_Sim is
--  Port ( );
end Multiply_Sim;

architecture Behavioral of Multiply_Sim is
    component Multiply is
        Port (
            A : in std_logic_vector(15 downto 0);
            B : in std_logic_vector(15 downto 0);
            C : out std_logic_vector(15 downto 0)
        );
    end component;
    
    signal A : std_logic_vector(15 downto 0);
    signal B : std_logic_vector(15 downto 0);
    signal C : std_logic_vector(15 downto 0);
begin
    uut1 : Multiply port map (A => A, B => B, C => C);
    stim_proc: process
    begin
        A <= x"0001";
        B <= x"1A33";
        wait for 100ns;
        A <= x"005c";
        B <= x"1563";
        wait for 100ns;
        A <= x"AF21";
        B <= x"1A23";
        wait for 100ns;
        A <= x"982C";
        B <= x"F233";
        wait for 100ns;
    end process;
end Behavioral;
