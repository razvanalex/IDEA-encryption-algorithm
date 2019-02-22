library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity Top is
    Port (
        NUM : in std_logic_vector(63 downto 0);
        KEY : in std_logic_vector(127 downto 0);
        ENC_DEC : in std_logic;
        RES : out std_logic_vector(63 downto 0)
    );
end Top;

architecture Behavioral of Top is
    component RoundEncrypt is
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
    end component;
    
    component HalfRoundEncrypt is
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
    end component;
    
    component modInverse is
      Port (
            NUM : in std_logic_vector(15 downto 0);
            RES : out std_logic_vector(15 downto 0) 
      );
    end component;
    
    type Full_Key_Type is array (6 downto 0) of std_logic_vector(127 downto 0);
    type Key_Type is array (51 downto 0) of std_logic_vector(15 downto 0);
    type Block_Type is array (35 downto 0) of std_logic_vector(15 downto 0);
    
    signal encKey : Key_Type := (others => (others => '0'));
    signal decKey : Key_Type := (others => (others => '0'));
    signal subKey : Key_Type := (others => (others => '0'));
    signal X_block : Block_Type := (others => (others => '0'));
    signal rot_Key : Full_Key_Type := (others => (others => '0'));
    
begin 
    -- Set the block
    X_block(0) <= NUM(63 downto 48);
    X_block(1) <= NUM(47 downto 32);
    X_block(2) <= NUM(31 downto 16);
    X_block(3) <= NUM(15 downto 0);
    
    -- Compute encryption keys
    rot_Key(0) <= KEY;
    
    GEN_KEY_ENC: for i in 0 to 5 generate
        -- Compute keys
        encKey(8 * i + 0) <= rot_Key(i)(127 downto 112);
        encKey(8 * i + 1) <= rot_Key(i)(111 downto 96);
        encKey(8 * i + 2) <= rot_Key(i)(95 downto 80);
        encKey(8 * i + 3) <= rot_Key(i)(79 downto 64);
        encKey(8 * i + 4) <= rot_Key(i)(63 downto 48);
        encKey(8 * i + 5) <= rot_Key(i)(47 downto 32);
        encKey(8 * i + 6) <= rot_Key(i)(31 downto 16);
        encKey(8 * i + 7) <= rot_Key(i)(15 downto 0);
        
         -- Rotate Key
        rot_Key(i + 1) <= to_stdlogicvector(to_bitvector(rot_Key(i)) rol 25);
    end generate;   
    
    encKey(48) <= rot_Key(6)(127 downto 112);
    encKey(49) <= rot_Key(6)(111 downto 96);
    encKey(50) <= rot_Key(6)(95 downto 80);
    encKey(51) <= rot_Key(6)(79 downto 64);
    
    -- Compute decription key    
    inv_1 : modInverse port map(NUM => encKey(48), RES => decKey(0));
    decKey(1) <= std_logic_vector(signed(0 - signed(encKey(49))));
    decKey(2) <= std_logic_vector(signed(0 - signed(encKey(50))));
    inv_2 : modInverse port map(NUM => encKey(51), RES => decKey(3));
    
    GEN_KEY_DEC: for i in 0 to 7 generate
        decKey((6 * i + 4) + 0) <= encKey(52 - (6 * i + 4) - 2);
        decKey((6 * i + 4) + 1) <= encKey(52 - (6 * i + 4) - 1);
        
        inv_i_1 : modInverse port map(NUM => encKey(52 - (6 * i + 4) - 6), RES => decKey((6 * i + 4) + 2));
        
        IF_GEN: if ((6 * i + 4) = 46) generate
            decKey((6 * i + 4) + 3) <= std_logic_vector(-signed(encKey(52 - (6 * i + 4) - 5)));
            decKey((6 * i + 4) + 4) <= std_logic_vector(-signed(encKey(52 - (6 * i + 4) - 4)));
        end generate;
        
        ELSE_GEN: if (not ((6 * i + 4) = 46)) generate        
            decKey((6 * i + 4) + 3) <= std_logic_vector(-signed(encKey(52 - (6 * i + 4) - 4)));
            decKey((6 * i + 4) + 4) <= std_logic_vector(-signed(encKey(52 - (6 * i + 4) - 5)));
        end generate;
        
        inv_i_2 : modInverse port map(NUM => encKey(52 - (6 * i + 4) - 3), RES => decKey((6 * i + 4) + 5));    
    end generate;
    
    -- Select between encryption and decryption
    process (ENC_DEC, encKey, decKey) 
    begin
        if (ENC_DEC = '1') then
            subKey <= encKey;
        else
            subKey <= decKey;
        end if;
    end process;
   
    -- Apply the 8 rounds
    GEN: for i in 0 to 7 generate
        round_i : RoundEncrypt port map(
            X0 => X_block(4 * i + 0),
            X1 => X_block(4 * i + 1),
            X2 => X_block(4 * i + 2),
            X3 => X_block(4 * i + 3),
            
            K1 => subKey(6 * i + 0),
            K2 => subKey(6 * i + 1),
            K3 => subKey(6 * i + 2),
            K4 => subKey(6 * i + 3),
            K5 => subKey(6 * i + 4),
            K6 => subKey(6 * i + 5),
            
            S0 => X_block(4 * i + 4),
            S1 => X_block(4 * i + 5),
            S2 => X_block(4 * i + 6),
            S3 => X_block(4 * i + 7)
        );
    end generate GEN;
    
    -- Apply the half round
    half : HalfRoundEncrypt port map(
        X0 => X_block(32),
        X1 => X_block(33),
        X2 => X_block(34),
        X3 => X_block(35),
        
        K1 => subKey(48),
        K2 => subKey(49),
        K3 => subKey(50),
        K4 => subKey(51),
        
        S0 => RES(63 downto 48),
        S1 => RES(47 downto 32),
        S2 => RES(31 downto 16),
        S3 => RES(15 downto 0)
    );
    
end Behavioral;
