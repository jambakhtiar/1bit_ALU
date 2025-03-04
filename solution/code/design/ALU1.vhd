library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU1 is
    Port (
        A           : in  std_logic;
        A_inv       : in  std_logic;
        B           : in  std_logic;
        B_inv       : in  std_logic;
		CarryIn     : in std_logic;
        OP0         : in  std_logic;
		OP1         : in std_logic;
		CarryOut    : out std_logic;
        Result      : out  std_logic
    );
end ALU1;

architecture Behavioral of ALU1 is
	component MUX2to1 is
    Port ( 
        I0 : in  std_logic;
        I1 : in  std_logic;
        S  : in  std_logic;
        O  : out std_logic
    );
   end component;


    component MUX4x1 is
    Port (
        I0 : in  std_logic;
        I1 : in  std_logic;
        I2 : in  std_logic;
        I3 : in  std_logic;
        S0 : in  std_logic;
        S1 : in  std_logic;
        O : out std_logic
    );
    end component;


    component FullAdder is
        Port (
            A   : in  std_logic;
            B   : in  std_logic;
            Cin : in  std_logic;
            Sum : out std_logic;
            Cout: out std_logic
        );
    end component;


signal not_A, not_B : std_logic;
signal mux2x1_A, mux2x1_B : std_logic;
signal and_w : std_logic;
signal or_w  : std_logic;
signal adder_w  : std_logic;


begin
 
 not_A <= not A;
 not_B <= not B;
 
Mux1: MUX2to1 port map
     ( 
        I0 => A,
        I1 => not_A,
        S  => A_inv, 
        O  => mux2x1_A
    );
    
Mux2: MUX2to1 port map
     ( 
        I0  => B,
        I1  => not_B,
        S   => B_inv,
        O   => mux2x1_B
    );



and_w <= mux2x1_A and mux2x1_B;
or_w  <= mux2x1_A or  mux2x1_B;


Adder: FullAdder  port map (
            A    => mux2x1_A,
            B    => mux2x1_B,
            Cin  => CarryIn,
            Sum  => adder_w,
            Cout => CarryOut
        );




mux4_1: MUX4x1 port map (
        I0 => and_w,
        I1 => or_w,
        I2 => adder_w,
        I3 => '0',
        S0 => OP0,
        S1 => OP1,
        O => Result
    );


end Behavioral;