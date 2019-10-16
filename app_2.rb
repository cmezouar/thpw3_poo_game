require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

# welcome message
def init_game
    puts " "
    puts "-----------------------------------------------------"
    puts "|       Bienvenue dans Fight Club                   |"
    puts "|Le but du jeu est d'être le dernier survivant      |"
    puts "-----------------------------------------------------"
    puts " "
end

# ask the user to create a player and save it
def create_human_player
    puts "Choisis un nom pour ton joueur"
    print "> "
    name = gets.chomp
    human_player = HumanPlayer.new(name)
    return human_player
end

# create the ennemies
def init_enemies
    enemies = []
    player1 = Player.new("Alice")
    enemies << player1
    player2 = Player.new("Jason")
    enemies << player2
    return enemies
end

# show the user's life level
def show_human_state(player)
    player.show_state
end

# ask the users' choice and store his answer
def choose_next_move(enemy1,enemy2)
    puts "Quelle action veux-tu effectuer ?"
    puts " "
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    puts " "
    puts "attaquer un joueur en vue"
    print "0 -  "
    enemy1.show_state
    print "1 -  "
    enemy2.show_state
    print ">"
    answer = gets.chomp
    while answer != "a" && answer != "s" && answer != "0" && answer != "1"
        puts "Réponse invalide"
        answer = gets.chomp
    end
    return answer
end


def fight (player_a,player_b)
    player_a.attacks(player_b)
end

# end of game message
def end_game(player)
    puts "La partie est finie."
    puts " "
    if player.life_points > 0
        puts "BRAVO TU AS GAGNE"
    else
        puts "Loser! Tu as perdu!"
    end
end
        


def game
    init_game
    user = create_human_player
    enemies = init_enemies
    player1 = enemies[0]
    player2 = enemies[1]
    while user.life_points >0 && (player1.life_points > 0 || player2.life_points >0)
        puts" "
        show_human_state(user)
        puts " "
        next_move = choose_next_move(player1,player2) 
        if next_move == "a"
            user.search_weapon
        elsif next_move == "s"
            user.search_health_pack
        elsif next_move == "0"
            fight(user,player1)
            if player1.life_points <=0 
                break
            end
        elsif next_move == "1"
            fight(user,player2)
            if player2.life_points <=0 
                break
            end
        end
        puts " "
        puts "Les ennemis t'attaquent !"
        enemies.each do |e|
            fight(e,user)
            if user.life_points <=0 
                break
            end
            puts " "
        end
        puts " "
        puts " "
    end
    end_game(user)
end

game
