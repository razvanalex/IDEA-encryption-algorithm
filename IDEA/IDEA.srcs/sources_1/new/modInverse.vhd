library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.Numeric_Std.ALL;

entity modInverse is
  Port (
        NUM : in std_logic_vector(15 downto 0);
        RES : out std_logic_vector(15 downto 0) 
  );
end modInverse;

architecture Behavioral of modInverse is 
    
begin
    process (NUM)
        variable a : integer;
        variable m : integer;
        variable x0 : integer;
        variable x1 : integer;
        variable m0, t, q : integer; 
    begin
        a := to_integer(unsigned(NUM));
        m := 65537;
        m0 := m;
        x0 := 0;
        x1 := 1;
        
        if (m = 1) then
            RES <= x"0000";
        else       
            while (a > 1) loop
                q := a / m;
                t := m;
                
                m := a mod m;
                a := t;
                
                t := x0;
                x0 := x1 - q * x0;
                x1 := t;
            end loop;
            
            if (x1 < 0) then
                x1 := x1 + m0;
            end if;
            
            RES <= std_logic_vector(to_unsigned(x1, RES'length));   
        end if;
    end process;

end Behavioral;
