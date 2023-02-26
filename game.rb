require_relative "codebraker.rb"
require_relative "codemaker.rb"
require_relative "display.rb"
require_relative 'codebreaker_ai.rb'
require_relative "codemaker_player.rb"

class Game
    include Display
    def initialize
        @code_breaker = Codebreaker.new
        @code_made = Codemaker.new
        @code_breaker_ai = CodebreakerAI.new
        @code_maker_player = CodemakerPlayer.new
    end

    #method that checks for winning condition
    def win_condition_check(guess)
        if guess.count("INCORRECT")==4
            return true
        end
    end

    # method that plays game 
    def play_game
        welcoming_message()
        choice_made = gets.chomp
        if choice_made == "1"
            play_game_codebraker()
        elsif choice_made == "2"
            play_game_codemaker()
        else
            puts "Plese enter existing option"
        end
    end

    protected
    # method that plays game as a codemaker
    def play_game_codemaker
        puts "Create a secret code for computer to guess!"
        begin 
            code_maker_player.code = code_maker_player.code_create()
            if code_maker_player.is_valid?(code_maker_player.code)==false
                puts "Please enter a possible code"
            end
        end while code_maker_player.is_valid?(code_maker_player.code)==false
        turn = 1
        until turn==12 || code_breaker_ai.won==true
            guessed_attempt = code_breaker_ai.generate_guess(code_breaker_ai.possible_guesses)
            p "The guessed attempt was: #{guessed_attempt}"
            feedback = code_maker_player.feedback_giver(guessed_attempt,code_maker_player.code)
            p feedback
            if feedback.count("CORRECT")==4
                puts "COMPUTER WON!"
                code_breaker_ai.won = true
            else
                turn+=1
                code_breaker_ai.update_possible_guesses(guessed_attempt,feedback,code_breaker_ai.possible_guesses)
            end
        end
        puts "----------------------------------------------"
        if code_breaker_ai.won==false
            puts "YOU WIN! Computer wasn't able to guess the code"
        end
    end

    # method that plays game as a codebreaker
    def play_game_codebraker
        turn = 1
        codebreaker_rules()
        until turn==12 || code_breaker.won==true
            guessed_attempt = convert_to_the_array(guess_the_code())
            feedback = code_made.feedback_giver(guessed_attempt,code_made.code)
            p feedback
            if feedback.count("CORRECT")==4
                winning_message()
                code_breaker.won = true
            else
                turn+=1
            end
            puts "------------------------------------------"
        end
        if code_breaker.won == false
            losing_message(code_made.code)
        end
    end

    protected
    attr_accessor :code_breaker
    attr_reader :code_made
    attr_accessor :code_maker_player
    attr_accessor :code_breaker_ai
end

new_game = Game.new
new_game.play_game()