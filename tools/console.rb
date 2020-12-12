require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

#Startup.new(name, founder, domain)
startup1 = Startup.new("Jingle Jangle", "Santa Claus", "North Pole")
startup2 = Startup.new("Ho Ho Hos", "Mrs. Klaus", "North Pole")
startup3 = Startup.new("Elf Tinder", "Fred", "Unknown")
startup4 = Startup.new("Sleigh Uber", "Rudolph", "Red Nose Prodcutions")

#VentureCapitalist.new(name, total_worth)
cap1 = VentureCapitalist.new("Nicole", 3000000000000)
cap2 = VentureCapitalist.new("Danny", 800999000)
cap3 = VentureCapitalist.new("Mara", 2000000000)

#FundingRound.new(Startup, VentureCapitalist, type, investment)
round1 = FundingRound.new(startup1, cap1, "Angel", 500000)
round2 = FundingRound.new(startup2, cap1, "Angel", 1000000)


binding.pry
0 #leave this here to ensure binding.pry isn't the last line