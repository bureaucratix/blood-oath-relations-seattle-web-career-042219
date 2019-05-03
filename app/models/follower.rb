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
    oaths.map(&:cult)
  end

  def join_cult(cult, current_date)
    if @age < cult.minimum_age
      puts "Sorry buddy, you're a bit young for the culting business."
    else
      new_oath = BloodOath.new(self, cult, current_date)
   end
  end

  def self.all
    @@all
  end

  def self.of_a_certain_age(age)
    @@all.select do |follower|
      follower.age >= age
    end
  end

  def my_cults_slogans
    cults.collect(&:slogan)
  end

  def self.most_active
    @@all.max_by do |flwr|
      flwr.cults.length
    end
  end

  def self.top_ten
    @@all.sort_by do |flwr|
      flwr.cults.length
    end.reverse[0..9]
  end

  def fellow_cult_members
    cults.collect do |cult|
      cult.oaths.collect(&:follower)
    end.flatten.uniq
  end
end
