require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

goodcult = Cult.new('Best Cult', "Seattle", 2019, "Please join.....please")
badcult = Cult.new('Worst Cult', "Tacoma", 2019, "We have fish")

alex = Follower.new("Alex", 27, "I love cults!")
laura = Follower.new("Laura", 39, "I don't love cults QUITE as much")
joe = Follower.new("Joe", 31, "I love fish!")


binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
