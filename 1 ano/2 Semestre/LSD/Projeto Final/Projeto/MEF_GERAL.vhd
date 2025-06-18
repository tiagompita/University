library ieee;
use ieee.std_logic_1164.all;

entity StateMachine is
    Port (
        clk : in std_logic;
        reset : in std_logic;
        Confirm_INIT : in std_logic;
        winA : in std_logic;
        winB : in std_logic;
        
        enable_GAMEINFO : out std_logic;
        enable_GAME : out std_logic;
        enable_WIN_A : out std_logic; 
        enable_WIN_B : out std_logic; 
        enable_INIT : out std_logic;

        confirm_prev_out : out std_logic;
        muxselect : out std_logic_vector(1 downto 0)
    );
end StateMachine;

architecture Behavioral of StateMachine is
    type state_type is (init, gameINFO, game, win_state_A, win_state_B); 
    signal state : state_type := init;
    
    signal confirm_prev : std_logic := '0';

begin
    process(clk, reset)
    begin
        if reset = '1' then
            state <= init;
            confirm_prev <= '0'; 
        elsif rising_edge(clk) then
            -- Update the previous state of Confirm_INIT
            confirm_prev <= Confirm_INIT;
            
            case state is
                when init =>
                    if Confirm_INIT = '1' and confirm_prev = '0' then
                        state <= gameINFO;
                    end if;
                when gameINFO =>
                    if Confirm_INIT = '1' and confirm_prev = '0' then
                        state <= game;
                    end if;
                when game =>
                    if winA = '1' then
                        state <= win_state_A; 
                    elsif winB = '1' then
                        state <= win_state_B; 
                    end if;
                when win_state_A =>
                    if Confirm_INIT = '1' and confirm_prev = '0' then
                        state <= init;
                    end if;
                when win_state_B => 
                    if Confirm_INIT = '1' and confirm_prev = '0' then
                        state <= init;
                    end if;
                when others =>
                    state <= init;
            end case;
        end if;
    end process;

    -- Output enables
    enable_INIT <= '1' when state = init else '0';
    enable_GAMEINFO <= '1' when state = gameINFO else '0';
    enable_GAME <= '1' when state = game else '0';
    enable_WIN_A <= '1' when state = win_state_A else '0'; 
    enable_WIN_B <= '1' when state = win_state_B else '0'; 
    
    confirm_prev_out <= confirm_prev;
    
    process(state)
    begin
        case state is
            when init =>
                muxselect <= "00";
            when gameINFO =>
                muxselect <= "01";
            when game =>
                muxselect <= "10";
            when win_state_A =>
                muxselect <= "11";
            when win_state_B => 
                muxselect <= "11";
            when others =>
                muxselect <= "XX";
        end case;
    end process;
end Behavioral;