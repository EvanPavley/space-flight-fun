class Astronaut
  attr_reader :name, :age
  attr_accessor :been_to_space

  @@all = []

  def initialize(name, age, been_to_space)
    @name = name
    @age = age
    @been_to_space = been_to_space
    @@all << self
  end

  def self.all
    @@all
  end

  def self.eldest
    sorted_astronaut_arr = self.all.sort_by{|astronaut|astronaut.age}
    sorted_astronaut_arr.last
  end
  #tests passed!
  #   [1] pry(main)> Astronaut.eldest
  # => #<Astronaut:0x007f8d77264768 @age=84, @been_to_space=true, @name="Amy">

  def self.been_to_space?
    self.all.select{|astronaut|astronaut.been_to_space}
  end
  #test passed!
  #   [1] pry(main)> Astronaut.been_to_space?
  # => [#<Astronaut:0x007fda01259fd0 @age=34, @been_to_space=true, @name="Buzz">,
  #  #<Astronaut:0x007fda01259f80 @age=56, @been_to_space=true, @name="Carl">,
  #  #<Astronaut:0x007fda01259f30 @age=84, @been_to_space=true, @name="Amy">]

  def self.find_all_by_name(name)
    self.all.select{|astronaut|astronaut.name == name}
  end
  #test passed!
  #   [1] pry(main)> Astronaut.find_all_by_name('Amy')
  # => [#<Astronaut:0x007fd73e2449e8 @age=84, @been_to_space=true, @name="Amy">,
  #  #<Astronaut:0x007fd73e244998 @age=23, @been_to_space=false, @name="Amy">]

  def space_flights
    Space_Flight.all.select{|space_flight|space_flight.astronaut == self}
  end
  #tests passed!
  #   [1] pry(main)> a2.space_flights
  # => [#<Space_Flight:0x007fb0413393e0
  #   @astronaut=
  #    #<Astronaut:0x007fb041339778 @age=34, @been_to_space=true, @name="Buzz">,
  #   @mission_name="A leap for human kind!",
  #   @spaceship=
  #    #<Spaceship:0x007fb041339548 @been_to_space=true, @name="Voyager 12">>]

  def spaceships
    space_flights.map{|space_flight|space_flight.spaceship}
  end
  #tests passed!
  #   [2] pry(main)> a2.spaceships
  # => [#<Spaceship:0x007fb041339548 @been_to_space=true, @name="Voyager 12">]

  def add_spaceship(spaceship, mission_name)
    Space_Flight.new(spaceship, self, mission_name)
  end
  #tests passed!
  #   [1] pry(main)> a1.add_spaceship(s6, "A whole new world")
  # => #<Space_Flight:0x007fd3e7169690
  #  @astronaut=
  #   #<Astronaut:0x007fd3e81d0678 @age=22, @been_to_space=false, @name="Evan">,
  #  @mission_name="A whole new world",
  #  @spaceship=#<Spaceship:0x007fd3e81d0268 @been_to_space=false, @name="derpherp">>
  # [2] pry(main)> a1.spaceships
  # => [#<Spaceship:0x007fd3e81d0268 @been_to_space=false, @name="derpherp">]

end #end of class
