require_relative './models/Astronaut.rb'
require_relative './models/Space_Flight.rb'
require_relative './models/Spaceship.rb'
require 'pry'

voyager1 = Spaceship.new('Voyager1',false)
voyager2 = Spaceship.new('Voyager2',false)
apollo5 = Spaceship.new('Apollo5',true)


neil = Astronaut.new('Neil Armstrong', 33, true)
john = Astronaut.new('John Glenn', 400, true)
buzz = Astronaut.new('Buzz Lightyear', 12, false)

flight_1 = SpaceFlight.new(voyager1,buzz, "Buzz's Big Mission")
flight_2 = SpaceFlight.new(voyager2,john, "John has a big mission")
flight_3 = SpaceFlight.new(apollo5,buzz, "Buzz returns to outer space")
flight_4 = SpaceFlight.new(apollo5,neil, "Neil supposedly walks the moon")

apollo5.add_astronaut(john,"Big john mission 2")

pry.start
