class Codebreaker
    # method that initializes guess array (where guessed attemps will be stored and won boolean that shows won/lost)
    def initialize
        @guess = []
        @won = false
    end

    attr_accessor :guess
    attr_accessor :won
end