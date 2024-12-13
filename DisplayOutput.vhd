----------------------------------------------------------------------------------
-- Name: Simran Gahra
-- Create Date: 12/02/2024
-- Design Name: BinarytoHex
-- Module Name: DisplayOutput - Behavioral
-- Project Name: BinarytoHex
-- Target Devices: BASYS3 architecture
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DisplayOutput is
    Port (
        current_digit : in integer;                       -- Current digit for REDY display
        player1 : in STD_LOGIC_VECTOR (3 downto 0);       -- Player 1 input
        player2 : in STD_LOGIC_VECTOR (3 downto 0);       -- Player 2 input
        redy_seg : out STD_LOGIC_VECTOR (0 to 6);         -- REDY display segments
        player1_display : out STD_LOGIC_VECTOR (0 to 6);  -- Player 1 display segments
        player2_display : out STD_LOGIC_VECTOR (0 to 6)   -- Player 2 display segments
    );
end DisplayOutput;

architecture Behavioral of DisplayOutput is
begin

    -- REDY Display Logic
    process(current_digit)
    begin
        case current_digit is
            when 0 => redy_seg <= "0001000"; -- "R"
            when 1 => redy_seg <= "0110000"; -- "E"
            when 2 => redy_seg <= "0000001"; -- "D"
            when 3 => redy_seg <= "1000100"; -- "Y"
            when others => redy_seg <= "1111111"; -- Blank
        end case;
    end process;

    -- Player 1 Display Logic
    process(player1)
    begin
        case player1 is
            when "0000" => player1_display <= "0000001"; -- "0"
            when "0001" => player1_display <= "1001111"; -- "1"
            when "0010" => player1_display <= "0010010"; -- "2"
            when "0011" => player1_display <= "0000110"; -- "3"
            when "0100" => player1_display <= "1001100"; -- "4"
            when "0101" => player1_display <= "0100100"; -- "5"
            when "0110" => player1_display <= "0100000"; -- "6"
            when "0111" => player1_display <= "0001111"; -- "7"
            when "1000" => player1_display <= "0000000"; -- "8"
            when "1001" => player1_display <= "0000100"; -- "9"
            when "1010" => player1_display <= "0000010"; -- "A"
            when "1011" => player1_display <= "1100000"; -- "B"
            when "1100" => player1_display <= "0110001"; -- "C"
            when "1101" => player1_display <= "1000010"; -- "D"
            when "1110" => player1_display <= "0110000"; -- "E"
            when "1111" => player1_display <= "0111000"; -- "F"
            when others => player1_display <= "1111111"; -- Blank
        end case;
    end process;

    -- Player 2 Display Logic
    process(player2)
    begin
        case player2 is
            when "0000" => player2_display <= "0000001"; -- "0"
            when "0001" => player2_display <= "1001111"; -- "1"
            when "0010" => player2_display <= "0010010"; -- "2"
            when "0011" => player2_display <= "0000110"; -- "3"
            when "0100" => player2_display <= "1001100"; -- "4"
            when "0101" => player2_display <= "0100100"; -- "5"
            when "0110" => player2_display <= "0100000"; -- "6"
            when "0111" => player2_display <= "0001111"; -- "7"
            when "1000" => player2_display <= "0000000"; -- "8"
            when "1001" => player2_display <= "0000100"; -- "9"
            when "1010" => player2_display <= "0000010"; -- "A"
            when "1011" => player2_display <= "1100000"; -- "B"
            when "1100" => player2_display <= "0110001"; -- "C"
            when "1101" => player2_display <= "1000010"; -- "D"
            when "1110" => player2_display <= "0110000"; -- "E"
            when "1111" => player2_display <= "0111000"; -- "F"
            when others => player2_display <= "1111111"; -- Blank
        end case;
    end process;

end Behavioral;
