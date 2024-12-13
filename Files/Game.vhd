----------------------------------------------------------------------------------
-- Name: Simran Gahra
-- Create Date: 12/02/2024
-- Design Name: BinarytoHex
-- Module Name: Game - Behavioral
-- Project Name: BinarytoHex
-- Target Devices: BASYS3 architecture
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Game is
    Port (
        clock : in STD_LOGIC;                     -- Clock signal
        reset : in STD_LOGIC;                     -- Reset button
        start : in STD_LOGIC;                     -- Start button
        player1 : in STD_LOGIC_VECTOR (3 downto 0); -- Player 1 input
        player2 : in STD_LOGIC_VECTOR (3 downto 0); -- Player 2 input
        seg : out STD_LOGIC_VECTOR (0 to 6);      -- 7-segment display cathodes
        an : out STD_LOGIC_VECTOR (3 downto 0)    -- 7-segment display anodes
    );
end Game;

architecture Behavioral of Game is

    -- Declare the DisplayOutput component
    component DisplayOutput
        Port (
            current_digit : in integer;
            player1 : in STD_LOGIC_VECTOR (3 downto 0);
            player2 : in STD_LOGIC_VECTOR (3 downto 0);
            redy_seg : out STD_LOGIC_VECTOR (0 to 6);
            player1_display : out STD_LOGIC_VECTOR (0 to 6);
            player2_display : out STD_LOGIC_VECTOR (0 to 6)
        );
    end component;

    -- Internal Signals
    signal clk_div : STD_LOGIC := '0';
    signal counter : integer := 0;
    signal current_digit : integer := 0;
    signal game_state : STD_LOGIC := '0';
    signal toggle : STD_LOGIC := '0';
    signal winner : STD_LOGIC_VECTOR (2 downto 0) := "000";
    signal win_state : STD_LOGIC := '0';
    signal redy_seg, player1_display, player2_display : STD_LOGIC_VECTOR (0 to 6);

begin

    -- Instantiate the DisplayOutput component
    DisplayOutput_inst : DisplayOutput
        Port map (
            current_digit => current_digit,
            player1 => player1,
            player2 => player2,
            redy_seg => redy_seg,
            player1_display => player1_display,
            player2_display => player2_display
        );

    -- Clock Divider
    process(clock)
    begin
        if rising_edge(clock) then
            counter <= counter + 1;
            if counter = 50000 then
                clk_div <= not clk_div;
                counter <= 0;
            end if;
        end if;
    end process;

    -- Main Game Logic
    process(clk_div, reset, start)
    begin
        if reset = '1' then
            game_state <= '0';
            win_state <= '0';
            winner <= "000";
            current_digit <= 0;
            seg <= redy_seg;
            an <= "1110";
        elsif start = '1' then
            game_state <= '1';
        elsif rising_edge(clk_div) then
            if game_state = '0' and win_state = '0' then
                current_digit <= (current_digit + 1) mod 4;
                seg <= redy_seg;
                case current_digit is
                    when 0 => an <= "0111";
                    when 1 => an <= "1011";
                    when 2 => an <= "1101";
                    when 3 => an <= "1110";
                    when others => an <= "1111"; -- Default case
                end case;
            elsif win_state = '1' then
                case winner is
                    when "001" => -- Player 1 Wins
                        case current_digit is
                            when 0 => seg <= "0011000"; an <= "0111"; -- "P"
                            when 1 => seg <= "1001111"; an <= "1011"; -- "1"
                            when 2 => seg <= "0111000"; an <= "1110"; -- "F"
                            when others => seg <= "1111111"; an <= "1111"; -- Default case
                        end case;
                    when "010" => -- Player 2 Wins
                        case current_digit is
                            when 0 => seg <= "0011000"; an <= "0111"; -- "P"
                            when 1 => seg <= "0010010"; an <= "1011"; -- "2"
                            when 2 => seg <= "0111000"; an <= "1110"; -- "F"
                            when others => seg <= "1111111"; an <= "1111"; -- Default case
                        end case;
                    when others => 
                        seg <= "1111111"; -- Blank
                        an <= "1111";
                end case;
                current_digit <= (current_digit + 1) mod 3;
            else
                toggle <= not toggle;
                if player1 = "1111" then
                    win_state <= '1';
                    winner <= "001";
                elsif player2 = "1111" then
                    win_state <= '1';
                    winner <= "010";
                elsif toggle = '0' then
                    seg <= player1_display;
                    an <= "1110";
                else
                    seg <= player2_display;
                    an <= "0111";
                end if;
            end if;
        end if;
    end process;

end Behavioral;
