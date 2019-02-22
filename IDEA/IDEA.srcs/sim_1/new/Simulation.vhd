library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Simulation is
--  Port ( );
end Simulation;

architecture Behavioral of Simulation is
    component Top is
        Port (
            NUM : in std_logic_vector(63 downto 0);
            KEY : in std_logic_vector(127 downto 0);
            ENC_DEC : in std_logic;
            RES : out std_logic_vector(63 downto 0)
        );
    end component;
    
    signal NUM : std_logic_vector(63 downto 0);
    signal KEY : std_logic_vector(127 downto 0);
    signal RES : std_logic_vector(63 downto 0);
    signal ENC_DEC : std_logic;
    
begin
    uut1 : Top port map(NUM => NUM, KEY => KEY, ENC_DEC => ENC_DEC, RES => RES);
    
    -- In aceasta simulare sunt 4 teste: 2 teste (criptare si decriptare) 
    -- pentru fiecare dintre cele 2 key diferite. ENC_DEC = 1 inseamna criptare, iar ENC_DEC = 0 inseamna decriptare
    -- Se poate observa ca D(E(M)) = M (adica, procesul de criptare-decriptare se realizeaza corect)
    stim_proc: process
    begin
        KEY <= "00000000011001000000000011001000000000010010110000000001100100000000000111110100000000100101100000000010101111000000001100100000";
        
        -- Test (1) 
        ENC_DEC <= '1';
        NUM <= "0000010100110010000010100110010000010100110010000001100111111010";
        wait for 125ns;
        -- D(E(M)) = M 
        ENC_DEC <= '0';
        NUM <= RES;
        wait for 125ns;
        
        -- Test (2)
        ENC_DEC <= '1';
        NUM <= x"deadc0dec0ffee19";
        wait for 125ns;
        --  D(E(M)) = M 
        ENC_DEC <= '0';
        NUM <= RES;
        wait for 125ns;
        
        KEY <= x"128934675500FFAACCEDEDED96E572D3";
        
        -- Test (3) 
        ENC_DEC <= '1';
        NUM <= "0000010100110010000010100110010000010100110010000001100111111010";
        wait for 125ns;
        -- D(E(M)) = M 
        ENC_DEC <= '0';
        NUM <= RES;
        wait for 125ns;
        
        -- Test (4)
        ENC_DEC <= '1';
        NUM <= x"deadc0dec0ffee19";
        wait for 125ns;
        --  D(E(M)) = M 
        ENC_DEC <= '0';
        NUM <= RES;
        wait;
        
    end process;

end Behavioral;
