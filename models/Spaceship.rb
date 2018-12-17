class Spaceship
  attr_reader :name
  attr_accessor :been_to_space

  @@all = []

  def initialize(name, been_to_space)
    @name = name
    @been_to_space = been_to_space
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_all_by_name(name)
    self.all.select do |spaceship|
      spaceship.name == name
    end
  end

  def self.fresh_spaceship
    self.all.select do |spaceship|
      !spaceship.been_to_space
    end
  end


  def my_flights
    SpaceFlight.all.select do |flight|
      flight.spaceship == self
    end
  end

  def astronauts
    my_flights.map do |flight|
      flight.astronaut
    end
  end

  def add_astronaut(astronaut,mission_name)
    SpaceFlight.new(self,astronaut,mission_name)
  end




end
