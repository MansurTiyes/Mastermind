require_relative "codebraker.rb"

class CodebreakerAI < Codebreaker
    def initialize
        super
        @possible_guesses = generate_possible_guesses()
    end

    # method that generates the guess
    def generate_guess(possible_guesses)
        actual_guess = []
        possible_guesses.each { |array| actual_guess.push(array.sample)}
        return actual_guess
    end

    # method that updates possible guesses
    def update_possible_guesses(made_guess,feedback,possible_guesses)
        made_guess.each_with_index do |value,index|
            if feedback[index]=="INCORRECT"
                possible_guesses[index]-=[value]
            else
                possible_guesses[index] = [value]
            end
        end
        return possible_guesses
    end

    attr_accessor :possible_guesses

    protected
    # method that generates initial possible guesses 
    def generate_possible_guesses
        possible_guesses = [[],[],[],[]]
        colors = ["red","blue","yellow","green","white","black"]
        possible_guesses.each_with_index { |value,index| possible_guesses[index] = colors }
        return possible_guesses
    end
end

