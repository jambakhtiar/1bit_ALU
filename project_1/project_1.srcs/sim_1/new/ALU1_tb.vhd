library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU1_tb is
end ALU1_tb;

architecture Behavioral of ALU1_tb is

    -- Constants for test parameters
    constant PERIOD : time := 10 ns;  -- Simulation period

    -- Signals for ALU1 ports
    signal A, A_inv, B, B_inv, CarryIn, OP0, OP1 : std_logic;
    signal CarryOut, Result : std_logic;

    -- Clock process
    signal clk : std_logic := '0';
    constant CLK_PERIOD : time := 10 ns;  -- Clock period

begin

    -- Instantiate the ALU1 module
    uut: entity work.ALU1
        port map (
            A           => A,
            A_inv       => A_inv,
            B           => B,
            B_inv       => B_inv,
            CarryIn     => CarryIn,
            OP0         => OP0,
            OP1         => OP1,
            CarryOut    => CarryOut,
            Result      => Result
        );

    -- Clock generation process
    process
    begin
           clk <= '0';
            wait for CLK_PERIOD / 2;
            clk <= '1';
            wait for CLK_PERIOD / 2;
    end process;

    -- Stimulus process
    process
    begin
        -- Test case Reet
        A       <= '0';
        A_inv   <= '0';
        B       <= '0';
        B_inv   <= '0';
        CarryIn <= '0';
        OP0     <= '0';
        OP1     <= '0';
        wait for PERIOD;
        

        -- A and B
        A_inv <= '0'; B_inv <= '0'; OP1 <= '0'; OP0 <= '0'; CarryIn <= '0';
        A<= '0'; B <= '0'; wait for 10 ns;
        A<= '0'; B <= '1'; wait for 10 ns;
        A<= '1'; B <= '0'; wait for 10 ns;
        A<= '1'; B <= '1'; wait for 40 ns;
        
         -- A or B
        A_inv <= '0'; B_inv <= '0'; OP1 <= '0'; OP0 <= '1'; CarryIn <= '0';
        A<= '0'; B <= '0'; wait for 10 ns;
        A<= '0'; B <= '1'; wait for 10 ns;
        A<= '1'; B <= '0'; wait for 10 ns;
        A<= '1'; B <= '1'; wait for 40 ns;
        
         -- A + B
         -- carry in = 0
        A_inv <= '0'; B_inv <= '0'; OP1 <= '1'; OP0 <= '0'; CarryIn <= '0';
        A<= '0'; B <= '0'; wait for 10 ns;
        A<= '0'; B <= '1'; wait for 10 ns;
        A<= '1'; B <= '0'; wait for 10 ns;
        A<= '1'; B <= '1'; wait for 40 ns;
        
         -- A + B
         -- carry in = 1
        A_inv <= '0'; B_inv <= '0'; OP1 <= '1'; OP0 <= '0'; CarryIn <= '1';
        A<= '0'; B <= '0'; wait for 10 ns;
        A<= '0'; B <= '1'; wait for 10 ns;
        A<= '1'; B <= '0'; wait for 10 ns;
        A<= '1'; B <= '1'; wait for 40 ns;
        
         -- A - B
        A_inv <= '0'; B_inv <= '1'; OP1 <= '1'; OP0 <= '0'; CarryIn <= '1';
        A<= '0'; B <= '0'; wait for 10 ns;
        A<= '0'; B <= '1'; wait for 10 ns;
        A<= '1'; B <= '0'; wait for 10 ns;
        A<= '1'; B <= '1'; wait for 40 ns;
        
        wait for PERIOD;

        wait;
    end process;

end Behavioral;
