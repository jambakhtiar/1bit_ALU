library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU8_tb is
end ALU8_tb;

architecture Behavioral of ALU8_tb is

    -- Component declaration for the ALU8
    component ALU8
        Port (
            A        : in  std_logic_vector(7 downto 0);
            A_in     : in  std_logic;
            B        : in  std_logic_vector(7 downto 0);
            B_inv    : in  std_logic;
            CarryIn  : in  std_logic;
            OP       : in  std_logic_vector(1 downto 0);
            CarryOut : out std_logic;
            Result   : out std_logic_vector(7 downto 0)
        );
    end component;

    -- Test signals
    signal A, B      : std_logic_vector(7 downto 0);
    signal A_in      : std_logic;
    signal B_inv     : std_logic;
    signal CarryIn   : std_logic;
    signal OP        : std_logic_vector(1 downto 0);
    signal CarryOut  : std_logic;
    signal Result    : std_logic_vector(7 downto 0);

begin

    -- Instantiate the ALU8
    uut: ALU8 port map (
        A        => A,
        A_in     => A_in,
        B        => B,
        B_inv    => B_inv,
        CarryIn  => CarryIn,
        OP       => OP,
        CarryOut => CarryOut,
        Result   => Result
    );

    -- Test process
    stim_proc: process
    begin
        -- Initialize inputs
        A       <= "00000000";
        B       <= "00000000";
        A_in    <= '0';
        B_inv   <= '0';
        CarryIn <= '0';
        OP      <= "00";

        wait for 10 ns;

        -- Test case 1: AND operation (A and B)
        -- A and B
        OP <= "00"; CarryIn <= '0'; A_in <= '0'; B_inv <= '0';
        A <= "01111000"; B <= "00011110"; wait for 40 ns;

        -- Test case 2: OR operation (A or B)
        -- A or B
        OP <= "01"; CarryIn <= '0'; A_in <= '0'; B_inv <= '0';
        A <= "01111000"; B <= "00011110"; wait for 40 ns;

        -- Test case 3
        -- A + B
        OP <= "10"; CarryIn <= '0'; A_in <= '0'; B_inv <= '0';
        A <= "00001111"; B <= "00111000"; wait for 40 ns;

       -- A - B
        OP <= "01"; CarryIn <= '1'; A_in <= '0'; B_inv <= '1';
        A <= "01010101"; B <= "00101010"; wait for 40 ns;

        wait;
    end process;

end Behavioral;
