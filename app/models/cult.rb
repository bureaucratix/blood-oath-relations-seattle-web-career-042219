class Cult
  attr_accessor :name, :location, :founding_year, :slogan
  @@all = []

  def initialize(name, location, founding_year, slogan)
    @name = name
    @location = location
    @founding_year = founding_year
    @slogan = slogan
    @@all << self
  end

  def recruit_follower(follower_object, current_date)
    new_oath = BloodOath.new(follower_object, self, current_date)
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

end
