class Player
	attr_accessor :name, :life_points

	def initialize(name)
		@name = name
		@life_points = 10
	end

	def show_state
		    if (self.class == Player)
			       puts "Il reste #{@life_points} points de vie a #{@name}"
		    else
			       puts "Il reste #{@life_points} points de vie a #{@name} et a une arme de lvl #{@weapon_level}."
		    end
	end

	def gets_damage(x)
	  @life_points = @life_points - x
		    if @life_points <= 0 
			       puts "#{self.name} est dead !"
		    else 
			  show_state
		    end
	end

	def attacks(advers)
		        puts "#{self.name} attaque #{advers.name}."
		        damages = self.compute_damage
		        puts "il lui inflige #{@damage} points de dommages."
		        ennemy.gets_damage(damages)
	end

	def compute_damage
		return rand(1..6)
	end
end

class HumanPlayer < Player
	attr_accessor :weapon_level
	def initialize(name)
		@weapon_level = 1
		super(name)
		@life_points = 100
	end

	def compute_damage
		rand(1..6) * @weapon_level
	end	

	def search_weapon
		new_weapon_lvl = rand(1..6)
		          puts "Tu a trouvé une arme de niveau : #{new_weapon_lvl}"
		    if new_weapon_lvl > @weapon_level
			        @weapon_level = new_weapon_lvl
		  	      puts "Je la garde !"
		    else  puts "je jette !"
		end
	end
	
	def search_health_pack
		dice = rand(1..6)
		case dice
		    when 1
			        puts "Tu n'as rien trouvé , désolé pour toi"
		    when 2..5
			  if @life_points + 50 > 100
				@life_points = 100
			  else
				@life_points += 50
			  end
			        puts "#{@name} +50 pts , tu as : #{@life_points}."
		    when 6
			  if @life_points + 80 > 100
				   @life_points = 100
			  else
				   @life_points += 80
			  end
			        puts "#{@name} +80 pts, tu as #{@life_points}"
		end
	end
end