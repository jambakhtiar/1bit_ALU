library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU8 is
  Port (
        A        : in std_logic_vector(7 downto 0);
        A_in     : in std_logic;
        B        : in std_logic_vector(7 downto 0);
        B_inv    : in std_logic;
        CarryIn  : in std_logic;
        OP       : in std_logic_vector (1 downto 0);
        CarryOut : out std_logic;
        Result   : out std_logic_vector(7 downto 0)
  );
end ALU8;

architecture Behavioral of ALU8 is
    component ALU1 is
        Port (
            A        : in  std_logic;
            A_inv    : in  std_logic;
            B        : in  std_logic;
            B_inv    : in  std_logic;
            CarryIn  : in  std_logic;
            OP0      : in  std_logic;
            OP1      : in  std_logic;
            CarryOut : out std_logic;
            Result   : out std_logic
        );
    end component;

    signal carry : std_logic_vector(8 downto 0);  -- Intermediate carry signals

begin

    -- Initial carry input
    carry(0) <= CarryIn;

    -- Instantiate ALU1 components for each bit
    ALU1_0: ALU1 port map (
        A        => A(0),
        A_inv    => A_in,
        B        => B(0),
        B_inv    => B_inv,
        CarryIn  => carry(0),
        OP0      => OP(0),
        OP1      => OP(1),
        CarryOut => carry(1),
        Result   => Result(0)
    );

    ALU1_1: ALU1 port map (
        A        => A(1),
        A_inv    => A_in,
        B        => B(1),
        B_inv    => B_inv,
        CarryIn  => carry(1),
        OP0      => OP(0),
        OP1      => OP(1),
        CarryOut => carry(2),
        Result   => Result(1)
    );

    ALU1_2: ALU1 port map (
        A        => A(2),
        A_inv    => A_in,
        B        => B(2),
        B_inv    => B_inv,
        CarryIn  => carry(2),
        OP0      => OP(0),
        OP1      => OP(1),
        CarryOut => carry(3),
        Result   => Result(2)
    );

    ALU1_3: ALU1 port map (
        A        => A(3),
        A_inv    => A_in,
        B        => B(3),
        B_inv    => B_inv,
        CarryIn  => carry(3),
        OP0      => OP(0),
        OP1      => OP(1),
        CarryOut => carry(4),
        Result   => Result(3)
    );

    ALU1_4: ALU1 port map (
        A        => A(4),
        A_inv    => A_in,
        B        => B(4),
        B_inv    => B_inv,
        CarryIn  => carry(4),
        OP0      => OP(0),
        OP1      => OP(1),
        CarryOut => carry(5),
        Result   => Result(4)
    );

    ALU1_5: ALU1 port map (
        A        => A(5),
        A_inv    => A_in,
        B        => B(5),
        B_inv    => B_inv,
        CarryIn  => carry(5),
        OP0      => OP(0),
        OP1      => OP(1),
        CarryOut => carry(6),
        Result   => Result(5)
    );

    ALU1_6: ALU1 port map (
        A        => A(6),
        A_inv    => A_in,
        B        => B(6),
        B_inv    => B_inv,
        CarryIn  => carry(6),
        OP0      => OP(0),
        OP1      => OP(1),
        CarryOut => carry(7),
        Result   => Result(6)
    );

    ALU1_7: ALU1 port map (
        A        => A(7),
        A_inv    => A_in,
        B        => B(7),
        B_inv    => B_inv,
        CarryIn  => carry(7),
        OP0      => OP(0),
        OP1      => OP(1),
        CarryOut => carry(8),
        Result   => Result(7)
    );

    -- Final carry output
    CarryOut <= carry(8);

end Behavioral;
