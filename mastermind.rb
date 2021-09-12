#so Let's set the respective classes

def game_start
  puts "Welcome to MasterMind. Enter 0 to be the codemaker or 1 to be the codebreaker"
    if ()
  puts "Go ahead and select the number of rounds"

end

def player_role()
  until
  end
  return selected_role

end

def round_count()
  until
  end
  return selected_rounds
end
class Player
    attr_accessor :name
    def initialize(name)
        @name = name
    end
    #has the ability to input a array of numbers and recieves a response
    #from the gamechoices module saying which pins are right
end

class AI
    attr_accessor :ai
    def initialize(ai)
        @ai = ai
    end
        #simple ai that keeps positions it gets right

end

class GameChoices
    attr_accessor :game
    def initialize
        @game = game
    end
 #This is where the where the player decides to be the codemaker/breaker
    #also this is where the pins "live" and you recieve a response from the included gamechoices module
end

module GameRules
    #contains the pins that say which numbers you got right
end

