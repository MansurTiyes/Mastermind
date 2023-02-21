class Codemaker
    def initialize
        @code = code_generator()
    end

    # method that randomly generates code based on colors available
    def code_generator()
        colors_array = ["red","blue","yellow","green","white","black"]
        code = []
        4.times do 
            code.push(colors_array.sample)
        end
        return code
    end

    # method that returns feedack of correct guesses by guesser and their placement
    # Takes in sample guess by guesser and returns array with values INCORRECT/CORRECT depending on whether guess at that place was correct
    def feedback_giver(sample_guess)
        feedback_array = []
        code.each_with_index do |value,index|
            if value==sample_guess[index]
                feedback_array.push("CORRECT")
            else
                feedback_array.push("INCORRECT")
            end
        end
        return feedback_array
    end

    attr_reader :code
end

new_codemaker = Codemaker.new
guess = ["blue", "green", "black", "blue"]
p new_codemaker.code
p new_codemaker.feedback_giver(guess)

