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
  #test passed!
  #   [2] pry(main)> Spaceship.all
  # => [#<Spaceship:0x007fdf32a59650 @been_to_space=false, @name="Apollo 42">,
  #  #<Spaceship:0x007fdf32a59600 @been_to_space=true, @name="Voyager 12">,
  #  #<Spaceship:0x007fdf32a595b0 @been_to_space=false, @name="Athena 22">,
  #  #<Spaceship:0x007fdf32a59560 @been_to_space=true, @name="Hubble tele">,
  #  #<Spaceship:0x007fdf32a594e8 @been_to_space=false, @name="Hubble tele">]

  def self.find_by_name(name)
    self.all.select{|spaceship|spaceship.name == name}
  end
  #test passed!
  # [1] pry(main)> Spaceship.find_by_name('Hubble tele')
  # => [#<Spaceship:0x007fdf32a59560 @been_to_space=true, @name="Hubble tele">,
  #  #<Spaceship:0x007fdf32a594e8 @been_to_space=false, @name="Hubble tele">]

  def self.fresh_spaceship
    self.all.select{|spaceship|!spaceship.been_to_space}
  end
  #test passed!
  #   [1] pry(main)> Spaceship.fresh_spaceship
  # => [#<Spaceship:0x007fd8b89ecf80 @been_to_space=false, @name="Apollo 42">,
  #  #<Spaceship:0x007fd8b89eceb8 @been_to_space=false, @name="Athena 22">,
  #  #<Spaceship:0x007fd8b89ece18 @been_to_space=false, @name="Hubble tele">]

  def space_flights
    Space_Flight.all.select{|space_flights|space_flights.spaceship == self}
  end

  def astronauts
    space_flights.map{|space_flights|space_flights.astronaut}
  end
  #tests passed!
  #   [3] pry(main)> s2.astronauts
  # => [#<Astronaut:0x007fa25d9e0c08 @age=34, @been_to_space=true, @name="Buzz">]

  def add_astronaut(astronaut, mission_name)
    Space_Flight.new(self, astronaut, mission_name)
  end
  #tests passed!
  #   [1] pry(main)> s4.add_astronaut(a6, 'A Mission')
  # => #<Space_Flight:0x007fcc0b11e200
  #  @astronaut=
  #   #<Astronaut:0x007fcc093f8298 @age=13, @been_to_space=false, @name="Kevin">,
  #  @mission_name="A Mission",
  #  @spaceship=
  #   #<Spaceship:0x007fcc093f9288 @been_to_space=true, @name="Hubble tele">>
  # [2] pry(main)> s4.astronauts
  # => [#<Astronaut:0x007fcc093f80b8 @age=56, @been_to_space=true, @name="Carl">,
  #  #<Astronaut:0x007fcc093f8040 @age=84, @been_to_space=true, @name="Amy">,
  #  #<Astronaut:0x007fcc093f8298 @age=13, @been_to_space=false, @name="Kevin">]

end #end of class
