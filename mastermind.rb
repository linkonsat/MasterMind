#so Let's set the respective classes
require 'pry-byebug'
module GameRules
    def valid_code()
      until ("1".."6").cover?(pin = gets.chomp) && pin.length == 4
        puts "Pin is out of range. Enter a number between 1-6"
      end
      return pin
    end
    
    def round_count()
      puts "Go ahead and select the number of rounds in between 8 -12"
    until ("8".."12").include?(round_amount = gets.chomp)   
    end
    return round_amount
  end
  #contains the pins that say which numbers you got right
end

    
def random_guess_gen()
  initial_guess = []
    4.times do
    initial_guess.push(rand(6))
    end
    return initial_guess 
  end



def player_choice()
    puts "Welcome to MasterMind. Enter 0 to be the codemaker or 1 to be the codebreaker"
  until (("0".."1").include?(selected_role = gets.chomp))
  end
  selected_role.to_i

end

class Player
  include GameRules
    attr_accessor :role, :code, :ai
    def initialize(role,ai)
        @role = role
        @ai = ai
    end
    
  def pin_creation
        puts "enter a 4 digit code with numbers between 1 - 6!"
        new_code = valid_code()
        split = new_code.split('')
        code = []
        split.each  { |item| code.push(item.to_i) }
        @code = code
  end  


    #has the ability to input a array of numbers and recieves a response
    #from the gamechoices module saying which pins are right

end

class AI
include GameRules
    attr_accessor :ai, :code, :guess
    def initialize(ai)
        @ai = ai
    end
    def pin_creation_ai
    code = []
    @code = code
    4.times do
    code.push(rand(6))
    end
    end

      
    def guess(feedback)
      
      guess = code
      
      feedback.each_with_index do |item, index| 
        if(item != "R") 
          guess[index] = rand(6) 
        end
      end
      

    
  end
        #simple ai that keeps positions it gets right

end

class GameRounds
  include GameRules
   attr_accessor :game
  def initialize(game)
    @game = game
  end

  def right_spot (guess, pins)
  feedback = []

  pins.each_with_index do |pin, index| 

    if (pin == guess[index]) 
      feedback.push("R") 
    elsif (pins.any?(guess[index]))
    feedback.push("W")
    else
      feedback.push("N")
    end
  end
  return feedback
  end

  def correct_pins(guess, pins)
  if (guess == pins)   
    return true
  end
  end
  def result(codemaker, codebreaker)
    if (codebreaker.code == codemaker.code)
      puts "You win codebreaker!"
    else 
      puts "You lost :(. the code was #{codemaker.code}"
    end
  end
end

def checker?(player_role, ai)
  if(player_role.role == 0)
    player_role.pin_creation 
    ai.pin_creation_ai
else
  ai.pin_creation_ai
end
end
def game_start()

  player_role = Player.new(player_choice(),"Player")
  ai = AI.new("computer")
  new_game = GameRounds.new("game")
  codemaker = player_role.role == 0 ? player_role : ai 
  binding.pry
  checker?(player_role,ai)
binding.pry
  codebreaker = player_role.role != 0 ?  player_role : ai
  puts "MasterMind is a game where you try and break the code created by the codemaker.
      \nYou will recieve feedback each round. A 'R' indicates it's the right number and spot
      \nA 'W' indicates the right number but wrong place whereas a 'N' indicates none are right. GL!"
  game_rounds(new_game, codemaker, codebreaker)
end


def game_rounds(new_game, codemaker, codebreaker)
  count = new_game.round_count.to_i
  if(codebreaker.ai == "Player")
  puts "Put in your guess!"
  codebreaker.pin_creation
  p  new_game.right_spot(codebreaker.code,codemaker.code)
  end
 
  until  count == 0 || new_game.correct_pins(codebreaker.code, codemaker.code)
    feedback = new_game.right_spot(codebreaker.code,codemaker.code)

    if (codebreaker.ai == "computer")  
      codebreaker.guess(feedback)
    elsif (codebreaker.ai == "Player")
      codebreaker.pin_creation
    end 
    p codebreaker.code
    p feedback
    count -= 1
  end
  rerun(new_game, codemaker, codebreaker)
end

def rerun(new_game, codemaker, codebreaker)
  new_game.result(codemaker,codebreaker)
  puts "If you would like to play again enter Y or enter any other character"
  if (response = gets.chomp == "Y")
    game_start()
  end
end
game_start()