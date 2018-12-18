class Space_Flight
  attr_reader :spaceship, :astronaut, :mission_name

  @@all = []

  def initialize(spaceship, astronaut, mission_name)
    @spaceship = spaceship
    @astronaut = astronaut
    @mission_name = mission_name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.mission_names
    self.all.each{|space_flight|puts space_flight.mission_name}
  end
  #tests passed
  #   [1] pry(main)> Space_Flight.mission_names
  # A leap for human kind!
  # WOW
  # cool.

end #end of class
