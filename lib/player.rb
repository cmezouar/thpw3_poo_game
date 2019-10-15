require "pry"

class Player

    attr_accessor :name, :life_points

    def initialize(player_name)
        @name = player_name
        @life_points = 10

    end

    def show_state
        puts "#{@name} a #{@life_points} points de vie."
    end

    def gets_damage(damage_points)
        @life_points = @life_points - damage_points
        if @life_points <= 0 
            puts "Le joueur #{name} a été tué !"
        end
    end

    def compute_damage
        return rand(1..6)
    end

    def attacks(player)
        puts "Le joueur #{name} attaque le joueur #{player.name}"
        damage_points = player.compute_damage
        puts "il lui inflige #{damage_points}"
        player.gets_damage(damage_points)
    end

end
