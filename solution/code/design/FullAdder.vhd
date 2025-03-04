library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FullAdder is
    Port (
        A   : in  std_logic;
        B   : in  std_logic;
        Cin : in  std_logic;
        Sum : out std_logic;
        Cout: out std_logic
    );
end FullAdder;

architecture Behavioral of FullAdder is
begin
    process(A, B, Cin)
    begin
        Sum  <= (A xor B) xor Cin;
        Cout <= (A and B) or (Cin and (A xor B));
    end process;
end Behavioral;
