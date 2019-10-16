require "pry"

require_relative 'player'

class Game

    attr_accessor :human_player, :enemies

    def initialize(player_name)
        @human_player = HumanPlayer.new(player_name)
        @enemies = []
        for i in (1..4)
            enemy = Player.new("enemy#{i}")
            @enemies << enemy
            i = i + 1
        end
    end

    def kill_player(player)
        @enemies.delete(player)
    end

    def is_still_ongoing?
        return @human_player.life_points > 0 && @enemies.size >0
    end

    def show_players
        @human_player.show_state
        @enemies.each do |enemy|
            enemy.show_state
        end
    end

    def menu
        puts "Quelle action veux-tu effectuer ?"
        puts " "
        puts "a - chercher une meilleure arme"
        puts "s - chercher à se soigner"
        puts " "
        puts "attaquer un joueur en vue"
        @enemies.each_with_index do |enemy, i|
            print "#{i} -  "
            enemy.show_state
        end
    end

    def menu_choice(answer)
        if answer == "a"
            @human_player.search_weapon
        elsif answer == "s"
            @human_player.search_health_pack
        elsif answer == "0"
            @human_player.attacks(@enemies[0])
            if @enemies[0].life_points <=0
                kill_player(@enemies[0])
            end
        elsif answer == "1"
            @human_player.attacks(@enemies[1])
            if @enemies[1].life_points <=0
                kill_player(@enemies[1])
            end
        elsif answer == "2"
            @human_player.attacks(@enemies[2])
            if @enemies[2].life_points <=0
                kill_player(@enemies[2])
            end
        elsif answer == "3"
            @human_player.attacks(@enemies[3])
            if @enemies[3].life_points <=0
                kill_player(@enemies[3])
            end
        end
    end

    def enemies_attack
        @enemies.each do |enemy|
            enemy.attacks(@human_player)
        end
    end

    def end
        puts "La partie est finie."
        puts " "
        if @human_player.life_points > 0
            puts "BRAVO TU AS GAGNE"
        else
            puts "Loser! Tu as perdu!"
        end
    end
            

end


