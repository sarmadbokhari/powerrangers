class Person
attr_reader :name, :cups
attr_accessor :caffeine_level

  def initialize(name, caffeine_level=0)
    @name = name
    @caffeine_level = caffeine_level
  end

  def run
    puts "I'm outta here!"
  end

  def scream
    puts "AHHH!!!"
  end

  def drink_coffee(cups)
    @caffeine_level += cups
  end
end

class PowerRanger < Person
attr_reader :color
attr_accessor :strength
  def initialize(caffeine_level=0, strength, color)
    super(caffeine_level)
    @strength = strength
    @color = color
  end

  def punch(person)
    puts "Poww! to #{person}"
    person.scream
    person.run
    @caffeine_level -= 1

    if @strength >= 5
      puts "#{person} was somersaulted into the air"
      @caffeine_level -= 2
    end
  end

  def use_megazord(person)
    if @caffeine_level >= 5000
      puts "MEGAZORD on #{person}"
      person.scream
      person.run
      @caffeine_level -= 2500
    else
      puts "Not enough energy to launch a MEGAZORD"
    end
  end

  def rest
    puts "Time to rest"
  end
end

class EvilNinja
end
