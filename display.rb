module Display
    # method that takes in user input for code guessed
    def guess_the_code
        puts "Please make an attemp to guess the code from the following colors:"
        puts "Red, Blue, Yellow, Green, White, Black"
        puts "Please input it in one line separated by commas"
        user_input = gets.chomp
        return user_input
    end

    def convert_to_the_array(user_input)
        return user_input.gsub(" ","").downcase.split(",")
    end
end

class Test
    include Display

    def initialize
        @input = guess_the_code()
    end

    attr_accessor :input
end

new_test = Test.new
p new_test.convert_to_the_array(new_test.input)