library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RoundEncrypt is
    Port (
        X0 : in std_logic_vector(15 downto 0);
        X1 : in std_logic_vector(15 downto 0);
        X2 : in std_logic_vector(15 downto 0);
        X3 : in std_logic_vector(15 downto 0);
        
        K1 : in std_logic_vector(15 downto 0);
        K2 : in std_logic_vector(15 downto 0);
        K3 : in std_logic_vector(15 downto 0);
        K4 : in std_logic_vector(15 downto 0);
        K5 : in std_logic_vector(15 downto 0);
        K6 : in std_logic_vector(15 downto 0);
        
        S0 : out std_logic_vector(15 downto 0);
        S1 : out std_logic_vector(15 downto 0);
        S2 : out std_logic_vector(15 downto 0);
        S3 : out std_logic_vector(15 downto 0)
    );
end RoundEncrypt;

architecture Behavioral of RoundEncrypt is
    component Multiply is
        Port (
            A : in std_logic_vector(15 downto 0);
            B : in std_logic_vector(15 downto 0);
            C : out std_logic_vector(15 downto 0)
        );
    end component;
    
    component AddMod16 is
     Port (
           A : in std_logic_vector(15 downto 0);
           B : in std_logic_vector(15 downto 0);
           C : out std_logic_vector(15 downto 0)
       );
    end component;
    
    signal step_1 : std_logic_vector(15 downto 0);
    signal step_2 : std_logic_vector(15 downto 0);
    signal step_3 : std_logic_vector(15 downto 0);
    signal step_4 : std_logic_vector(15 downto 0);
    signal step_5 : std_logic_vector(15 downto 0);
    signal step_6 : std_logic_vector(15 downto 0);
    signal step_7 : std_logic_vector(15 downto 0);
    signal step_8 : std_logic_vector(15 downto 0);
    signal step_9 : std_logic_vector(15 downto 0);
    signal step_10: std_logic_vector(15 downto 0);
    
begin
    mult1 : Multiply Port map(A => X0, B => K1, C => step_1);
    add1  : AddMod16 Port map(A => X1, B => K2, C => step_2);
    add2  : AddMod16 Port map(A => X2, B => K3, C => step_3);
    mult2 : Multiply Port map(A => X3, B => K4, C => step_4);
    
    step_5 <= step_1 xor step_3;
    step_6 <= step_2 xor step_4;
    
    mult3 : Multiply Port map(A => step_5, B => K5, C => step_7);
    add3  : AddMod16 Port map(A => step_6, B => step_7, C => step_8);
    mult4 : Multiply Port map(A => step_8, B => K6, C => step_9);
    add4  : AddMod16 Port map(A => step_7, B => step_9, C => step_10);
    
    -- Note that the swap is done here. See the diagram for more details
    S0 <= step_1 xor step_9;
    S1 <= step_3 xor step_9; 
    S2 <= step_2 xor step_10;
    S3 <= step_4 xor step_10;  
end Behavioral;
