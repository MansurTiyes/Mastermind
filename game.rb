require_relative "codebraker.rb"
require_relative "codemaker.rb"
require_relative "display.rb"

class Game
    include Display
    def initialize
        @code_breaker = Codebreaker.new
        @code_made = Codemaker.new
    end

    #method that checks for winning condition
    def win_condition_check(guess)
        if guess.count("INCORRECT")==4
            return true
        end
    end

    def play_game
        turn = 1
        welcoming_message()
        until turn==12 || code_breaker.won==true
            guessed_attempt = convert_to_the_array(guess_the_code())
            feedback = code_made.feedback_giver(guessed_attempt)
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
end

new_game = Game.new
new_game.play_game