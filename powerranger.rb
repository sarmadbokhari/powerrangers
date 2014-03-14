module Punch
  def punch(person)
    puts "Poww! to #{person}"
    person.scream
    person.run
    @caffeine_level -= 1

    if @strength >= 5
      puts "#{person.name} was somersaulted into the air"
      @caffeine_level -= 2
    end
  end
end

module FightScene
  def fight(ranger1, ranger2, ninja1, ninja2, person1, person2)
    ranger1.punch(ninja1)
    ninja2.punch(ranger2)
    ninja1.cause_mayhem(person1)
    person1.scream
    person2.run
    ranger2.drink_coffee(5000)
    ranger2.use_megazord(ninja1)
  end
end

class Person
  include FightScene
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
    puts "I just drank #{cups} cups of coffee"
    @caffeine_level += cups
  end
end

class PowerRanger < Person
  include Punch
  include FightScene
attr_reader :color
attr_accessor :strength

  def initialize(name, color, caffeine_level=10, strength=10)
    super(name, caffeine_level)
    @strength = caffeine_level
    @color = color
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

class EvilNinja < Person
include Punch
include FightScene
  def initialize(name, caffeine_level=10, strength, evilness)
    super(name, caffeine_level)
    @strength = caffeine_level
    @evilness = evilness
  end

  def cause_mayhem(person)
    person.caffeine_level = 0
    puts "#{person.name} caffeine level reduced to smitherines"
  end
end

john = Person.new("John")
jacob = Person.new("Jacob")
kate = PowerRanger.new("Kate", "white")
susy = PowerRanger.new("Susy", "pink")
martin = EvilNinja.new("Martin", 100, 100)
smith = EvilNinja.new("Smith", 100, 100)
