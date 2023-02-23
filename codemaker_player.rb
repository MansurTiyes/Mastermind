require_relative "codemaker.rb"

class CodemakerPlayer < Codemaker
    def initialize
        @code = []
    end

    # method that asks for user input for colors
    def code_create
        puts "Please enter the code you want to create from the following colors separated by comma:"
        puts "Red, Blue, Yellow, Green, White, Black"
        return get.chomp.downcase.split(",")
    end

    # method that checks that input code is valid
    def is_valid?(code)
        colors = ["red","blue","yellow","green","white","black"]
        code.each do |value|
            if colors.include?(value)==false
                return false
            end
        end
        return true
    end

    attr_accessor :code
end