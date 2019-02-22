library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity HalfRoundEncrypt is
    Port (
        X0 : in std_logic_vector(15 downto 0);
        X1 : in std_logic_vector(15 downto 0);
        X2 : in std_logic_vector(15 downto 0);
        X3 : in std_logic_vector(15 downto 0);
        
        K1 : in std_logic_vector(15 downto 0);
        K2 : in std_logic_vector(15 downto 0);
        K3 : in std_logic_vector(15 downto 0);
        K4 : in std_logic_vector(15 downto 0);
        
        S0 : out std_logic_vector(15 downto 0);
        S1 : out std_logic_vector(15 downto 0);
        S2 : out std_logic_vector(15 downto 0);
        S3 : out std_logic_vector(15 downto 0)
    );
end HalfRoundEncrypt;

architecture Behavioral of HalfRoundEncrypt is
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
begin
   mult1 : Multiply Port map(A => X0, B => K1, C => S0);
   add1  : AddMod16 Port map(A => X2, B => K2, C => S1);
   add2  : AddMod16 Port map(A => X1, B => K3, C => S2);
   mult2 : Multiply Port map(A => X3, B => K4, C => S3);
end Behavioral;
