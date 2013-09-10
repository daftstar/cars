class Car
	@@total_car_count = 0
	@@colors_per_car = Hash.new(0)


	attr_accessor :color

	# @@red = 0
	# @@blue = 0
	# @@green = 0

	def initialize(color)
		@fuel = 10
		@distance = 0
		@@total_car_count += 1 #every time a car is created, the counter is incremented by 1
		@@colors_per_car[color] += 1 
		@color = color
	end

	## ------------ CLASS METHODS -----------------------------------------

	def self.total_car_count #this allows us to call the class variable @@total_car_count
		@@total_car_count #implied return
	end

	def self.colors_per_car #this allows us to call the class variable @@total_car_count
		
		puts "you have #{@@colors_per_car} cars" #implied return
	end

	def self.most_popular_color
		colors_by_popularity = @@colors_per_car.sort_by { |color, amount| amount }
		most_pop = colors_by_popularity[-1]
	end


	## ------------ INSTANCE METHODS -----------------------------------------

	def change_car_color(old_color,new_color)
		@@colors_per_car[old_color] -= 1 
		@@colors_per_car[new_color] += 1 
	end




	def to_s()
		"I'm a car! I've driven #{@distance} miles and have #{@fuel} gallons gas left"
	end

	def drive(miles)
		if (@fuel - miles/20.0) >= 0
			@distance += miles
			@fuel -= miles/20.0
			#puts "you've driven #{@distance} miles"
		else
			@distance += @fuel * 20.0
			@fuel = 0
			puts "You're out of gas!"
		end
	end

	def fuel_up()
		gallons_needed = 10.0 - @fuel
		puts "You must pay $#{3.5 * gallons_needed}"
		@fuel = 10.0
	end
end
#--------------------------



bluecar1 = Car.new("blue")
bluecar2 = Car.new("blue")
redcar = Car.new("red")
greencar = Car.new("green")
nastycar = Car.new("yellow")
indycar = Car.new("white")


puts Car.colors_per_car
puts""
puts Car.most_popular_color

nastycar.change_car_color("yellow","red")
indycar.change_car_color("yellow","red")
puts "-----"
puts Car.colors_per_car
puts""
puts Car.most_popular_color


# redcar1 = Car.new(:red)
# redcar2 = Car.new(:red)
# bluecar2 = Car.new(:blue)
# car_R = Car.new(:red)
# car_g = Car.new(:green)


# car_c = Car.new()
# car_d = Car.new()

# puts car_a
# puts car_b
# car_a.drive(10)
# puts car_a
# puts car_b
# car_a.drive(232)
# car_b.drive(117)
# puts car_a
# puts car_b
# puts "---------------"
# puts Car.total_car_count
#puts car_b

# #puts car_b.drive(1)
# car_a.drive(1000)
# puts car_a.to_s