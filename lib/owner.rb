require 'pry'
class Owner
  
  @@all = []
  attr_reader :name

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def species
    @species
  end

  def say_species
    "I am a #{@species}."
  end 

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all = []
  end

  def cats
    Cat.all.select do |cats|
      cats.owner == self
    end
  end

  def dogs
    Dog.all.select do |dogs|
      dogs.owner == self
    end
  end

  def buy_cat(cat_name)
    new_cat = Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    new_dog = Dog.new(dog_name, self)
  end

  def walk_dogs
    self.dogs.each do |dogs_to_walk|
      dogs_to_walk.mood = "happy"
    end
  end

  def feed_cats
    self.cats.each do |cats_to_feed|
      cats_to_feed.mood = "happy"
    end
  end

  def sell_pets
    self.cats.each do |cats_to_sell|
      cats_to_sell.mood = "nervous"
      cats_to_sell.owner = nil
    end
    self.dogs.each do |dogs_to_sell|
      dogs_to_sell.mood = "nervous"
      dogs_to_sell.owner = nil
    end
    @@all = []

  end

  def list_pets
    "I have #{self.dogs.length} dog(s), and #{self.cats.length} cat(s)."
  end

end