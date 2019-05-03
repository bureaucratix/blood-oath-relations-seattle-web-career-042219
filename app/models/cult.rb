require "pry"
class Cult
  attr_accessor :name, :location, :founding_year, :slogan, :minimum_age
  @@all = []

  def initialize(name, location, founding_year, slogan, minimum_age = 18)
    @name = name
    @location = location
    @founding_year = founding_year
    @slogan = slogan
    @minimum_age = minimum_age
    @@all << self
  end

  def recruit_follower(follower_object, current_date)
    if follower_object.age < @minimum_age
      puts "Sorry buddy, you're a bit young for the culting business."
    else
      new_oath = BloodOath.new(follower_object, self, current_date)
    end
  end

  def oaths
    BloodOath.all.select do |oath|
      oath.cult == self
    end
  end

  def followers
    self.oaths.map do |oath|
      oath.follower
    end
  end

  def cult_population
    self.followers.length
  end

  def self.all
    @@all
  end

  def self.find_by_name(search_name)
    @@all.find do |cult|
      cult.name == search_name
    end
  end

  def self.find_by_location(search_location)
    @@all.select do |cult|
      cult.location == search_location
    end
  end

  def self.find_by_founding_year(search_year)
    @@all.select do |cult|
      cult.founding_year == search_year
    end
  end

  def average_age
    ages = self.followers.collect do |flwr|
      flwr.age
    end
    ages.sum / ages.length
  end

  def my_followers_mottos
    self.followers.collect do |flwr|
      flwr.life_motto
    end
  end

  def self.least_popular
    @@all.sort_by do |cult|
      cult.cult_population
    end.first
  end

    def self.most_common_location
      locations = {}
      @@all.each do |cult|
        locations[cult.location] ||= 0
        locations[cult.location] += 1
      end
      binding.pry
      locations.max_by{|k,v| v}[0]
    end

end
