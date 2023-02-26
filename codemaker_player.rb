require_relative "codemaker.rb"

class CodemakerPlayer < Codemaker
    def initialize
        @code = []
    end

    # method that asks for user input for colors
    def code_create
        puts "Please enter the code you want to create from the following colors separated by comma:"
        puts "Red, Blue, Yellow, Green, White, Black"
        return gets.chomp.downcase.gsub(" ","").split(",")
    end

    # method that checks that input code is valid
    def is_valid?(code)
        if code.length<4
            return false
        end
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