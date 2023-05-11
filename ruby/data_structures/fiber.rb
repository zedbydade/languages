puts '1: Start program.'

f = Fiber.new do 
  puts '3: Entered fiber.'
  Fiber.yield 
  puts '5: Resumed fiber.'
end

puts '2: Resume fiber first time.'
f.resume 

puts '4: Resume fiber second time.'
f.resume 

puts '6: Finished.'
