require_relative 'EngineeringCalculator.rb'
require_relative 'SimpleCalculator.rb'

#module = namespace
#но модули нельз
s = SimpleCalculator.new
e = EngineeringCalculator.new

puts s.add(2, 3)
puts s.add("asd", "asfg")

puts s.subtract(15, 5)
puts s.subtract("asd", 2)

puts s.multiply(10, 10)
puts s.multiply(10, "asdf")

puts s.divide(100, 5)
puts s.divide(100, 0)
puts s.divide(100, "sd")


puts e.add(15.233,15.2)
puts e.subtract(100.35, 25.2)
puts e.multiply(25.552,25.245)
puts e.divide(250, 32.252)

puts e.powerOf(15, 2)
puts e.powerOf(15, 0)
puts e.powerOf(15, "asdf")

puts e.percentageOf(123, 12)
puts e.percentageOf(123, -2)
puts e.percentageOf(123, 122)
puts e.percentageOf(123, "Asdf")

