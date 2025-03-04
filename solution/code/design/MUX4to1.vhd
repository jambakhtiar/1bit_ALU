library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX4x1 is
    Port (
        I0 : in  std_logic;
        I1 : in  std_logic;
        I2 : in  std_logic;
        I3 : in  std_logic;
        S0 : in  std_logic;
        S1 : in  std_logic;
        O : out std_logic
    );
end MUX4x1;

architecture Behavioral of MUX4x1 is
    component MUX2to1 is
        Port ( 
            I0 : in  std_logic;
            I1 : in  std_logic;
            S  : in  std_logic;
            O  : out std_logic
        );
    end component;

    signal mux2x1_0_out, mux2x1_1_out : std_logic;
begin
    -- First level of MUX2x1
    Mux2x1_0: MUX2to1
        port map (
            I0 => I0,
            I1 => I1,
            S  => S0,
            O  => mux2x1_0_out
        );

    Mux2x1_1: MUX2to1
        port map (
            I0 => I2,
            I1 => I3,
            S  => S0,
            O  => mux2x1_1_out
        );

    -- Second level of MUX2x1 to select between the outputs of first level
    Mux2x1_final: MUX2to1
        port map (
            I0 => mux2x1_0_out,
            I1 => mux2x1_1_out,
            S  => S1,
            O  => O
        );

end Behavioral;
