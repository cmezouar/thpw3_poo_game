require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

@player1 = Player.new("Alice")
@player2 = Player.new("Jason")

def init_game
    puts "Voici l'état de chaque joueur:"
    @player1.show_state
    @player2.show_state
    
end

def fight
    puts "Passons à la phase d'attaque:"
    @player2.attacks(@player1)
    @player1.attacks(@player2)
end

def game
    
    while @player1.life_points >0 && @player2.life_points >0
        init_game
        puts " "
        puts "Passons à la phase d'attaque:"
        @player2.attacks(@player1)
        if @player1.life_points <=0 
            break
        end
        @player1.attacks(@player2)
        if @player2.life_points <=0 
            break
        end
        puts " "
    end
end

game
#binding.pry