require 'pry'
require_relative 'models/Astronaut.rb'
require_relative 'models/Space_Flight.rb'
require_relative 'models/Spaceship.rb'

a1 = Astronaut.new('Evan', 22, false)
a2 = Astronaut.new('Buzz', 34, true)
a3 = Astronaut.new('Carl', 56, true)
a4 = Astronaut.new('Amy', 84, true)
a5 = Astronaut.new('Amy', 23, false)
a6 = Astronaut.new('Kevin', 13, false)

s1 = Spaceship.new('Apollo 42', false)
s2 = Spaceship.new('Voyager 12', true)
s3 = Spaceship.new('Athena 22', false)
s4 = Spaceship.new('Hubble tele', true)
s5 = Spaceship.new('Hubble tele', false)
s6 = Spaceship.new('derpherp', false)


sf1 = Space_Flight.new(s2, a2, "A leap for human kind!")
sf2 = Space_Flight.new(s4, a3, "WOW")
sf3 = Space_Flight.new(s4, a4, "cool.")

binding.pry
