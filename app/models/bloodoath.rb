class BloodOath
  attr_accessor :initiation_date, :cult, :follower
  @@all = []

  def initialize(follower, cult, initiation_date)
    @follower = follower
    @cult = cult
    @initiation_date = initiation_date
    @@all << self
  end

  def self.all
    @@all
  end

  def self.first_oath
    @@all.sort_by do |oath|
      oath.initiation_date
    end.first
  end

end
