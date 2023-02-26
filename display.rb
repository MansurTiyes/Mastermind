module Display
    # welcoming message that explains the rules
    def welcoming_message
        puts "Welcome to Mastermind Game"
        puts "Press 1 to play as a codebreaker"
        puts "Press 2 to play as a codemaker"
    end

    # rules for playing as a codebraker
    def codebreaker_rules
        puts "Try to guess the secret code consisting of four colors created by AI"
        puts 'Every time you guess, feedback will be given on whether the code was correct'
    end

    # method that takes in user input for code guessed
    def guess_the_code
        puts "Please make an attemp to guess the code from the following colors:"
        puts "Red, Blue, Yellow, Green, White, Black"
        puts "Please input it in one line separated by commas"
        user_input = gets.chomp
        return user_input
    end

    # method that converts user input to the possible code array
    def convert_to_the_array(user_input)
        return user_input.gsub(" ","").downcase.split(",")
    end

    def winning_message
        puts "YOU WON! YOU CORRECTLY GUESSED THE CODE"
    end

    def losing_message (actual_code)
        puts "YOU LOST! THE CODE WAS #{actual_code.join(", ")}"
    end
end

