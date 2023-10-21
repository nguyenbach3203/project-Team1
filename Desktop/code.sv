library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity nhan2matran is
    Port ( Clk      : in STD_LOGIC;
           nReset   : in STD_LOGIC;
           Start    : in STD_LOGIC;
           Data_A   : in STD_LOGIC_VECTOR(7 downto 0);
           Data_B   : in STD_LOGIC_VECTOR(7 downto 0);
           WE_A     : in STD_LOGIC;
           WE_B     : in STD_LOGIC;
           Addr_A_in: in STD_LOGIC_VECTOR(7 downto 0);
           Addr_B_in: in STD_LOGIC_VECTOR(7 downto 0);
           Addr_C_in: in STD_LOGIC_VECTOR(7 downto 0);
           Data_out : out STD_LOGIC_VECTOR(7 downto 0);
           RE_C     : out STD_LOGIC;
           Done     : buffer STD_LOGIC);
end nhan2matran;

architecture Behavioral of nhan2matran is
    constant N: integer := 8; -- Change this value according to the desired matrix size
    type matrix is array(0 to N-1, 0 to N-1) of STD_LOGIC_VECTOR(7 downto 0);
    signal Matrix_A, Matrix_B, Matrix_C: matrix;
    signal ColumnA, RowA, ColumnB, RowB: integer := N; -- Adjust matrix size here
    signal i, j, k: integer := 0;
    signal isComputing: boolean := false;

begin
    process(Clk, nReset, Start, Done)
begin
    if nReset = '1' then
        Done <= '0';
        isComputing <= false;
    elsif rising_edge(Clk) then
        if Start = '1' and not isComputing then
            -- Initialization code

        elsif isComputing then
            -- Matrix multiplication code

            if k = RowB-1 then
                if j = ColumnB-1 then
                    j <= 0;
                    if i = RowA-1 then
                        i <= 0;
                        isComputing <= false;
                        Done <= '1';
                    else
                        i <= i + 1;
                    end if;
                else
                    j <= j + 1;
                end if;
            else
                k <= k + 1;
            end if;
        end if;
    end if;
end process;


    process(Start)
    begin
        if Start = '1' then
            Done <= '0';
        end if;
    end process;

    process(Done)
    begin
        if Done = '1' then
            RE_C <= '1';
            Data_out <= Matrix_C(i, j);
        else
            RE_C <= '0';
        end if;
    end process;
end Behavioral;
