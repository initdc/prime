def prime?(num)
  return true if num < 4
  (3..num / 3).each do |div|
    return false if num % div == 0
  end
  true
end

count = 0
duration = Time.measure do
  (1..250000).step(2) do |num|
    count += 1 if prime?(num)
  end
end
puts "count   : #{count}"
puts "duration: #{duration}"
