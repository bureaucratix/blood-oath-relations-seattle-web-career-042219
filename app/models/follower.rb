class Follower
  attr_accessor :name, :age, :life_motto
  @@all = []

  def initialize(name, age, life_motto)
    @name = name
    @age = age
    @life_motto = life_motto
    @@all << self
  end

  def oaths
    BloodOath.all.select do |oath|
      oath.follower == self
    end
  end

  def cults
    self.oaths.map do |oath|
      oath.cult
    end
  end

  def join_cult(cult, current_date)
     new_oath = BloodOath.new(self, cult, current_date)
  end

  def self.all
    @@all
  end

  def self.of_a_certain_age(age)
    @@all.select do |follower|
      follower.age >= age
    end
  end

end
