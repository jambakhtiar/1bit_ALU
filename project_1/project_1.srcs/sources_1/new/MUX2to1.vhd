library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX2to1 is
    Port ( 
        I0 : in  std_logic;
        I1 : in  std_logic;
        S  : in  std_logic;
        O  : out std_logic
    );
end MUX2to1;

architecture Behavioral of MUX2to1 is
begin
    process(I0, I1, S)
    begin
        if S = '0' then
            O <= I0;
        else
            O <= I1;
        end if;
    end process;
end Behavioral;
