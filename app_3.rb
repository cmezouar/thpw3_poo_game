require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

def init_game
    puts " "
    puts "-----------------------------------------------------"
    puts "|       Bienvenue dans Fight Club                   |"
    puts "|Le but du jeu est d'être le dernier survivant      |"
    puts "-----------------------------------------------------"
    puts " "
    puts "Choisis un nom pour ton joueur"
    print "> "
    name = gets.chomp
    my_game = Game.new(name)
    return my_game
end

def play 
    new_game = init_game
    while new_game.is_still_ongoing? == true
        puts " "
        new_game.show_players
        puts " "
        new_game.menu
        answer = gets.chomp
        while answer != "a" && answer != "s" && answer != "0" && answer != "1"&& answer != "2" && answer != "3"
            puts "Réponse invalide"
            answer = gets.chomp
        end
        puts " "
        new_game.menu_choice(answer)
        puts " "
        new_game.enemies_attack
    end
    new_game.end
end

play

