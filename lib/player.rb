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

class HumanPlayer < Player
    
    attr_accessor :weapon_level

    def initialize(player_name)
        @name = player_name
        @life_points = 100
        @weapon_level = 1

    end

    def show_state
        puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}."
    end

    def compute_damage
        return rand(1..6) * @weapon_level
    end

    def search_weapon
        new_weapon_level = rand(1..6)
        puts "Tu as trouvé une arme de niveau #{new_weapon_level}."
        if new_weapon_level > @weapon_level
            @weapon_level = new_weapon_level
            puts "Youhou! Elle est meilleure que ton arme actuelle : tu la prends."            
        else
            puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
        end
    end

    def search_health_pack
        dice = rand(1..6)
        if dice == 1
            puts "Tu n'as rien trouvé..."
        elsif dice >= 2 && dice <= 5
            puts "Bravo, tu as trouvé un pack de +50 points de vie!"
            diff = 100 - @life_points
            if diff >= 50
                @life_points = @life_points + 50     
            else
                @life_points = @life_points + diff
            end
        else
            puts "Wow, tu as trouvé un pack de +80 points de vie!"
            diff = 100 - @life_points
            if diff >= 80
                @life_points = @life_points + 80     
            else
                @life_points = @life_points + diff
            end
        end
    end

end

#binding.pry