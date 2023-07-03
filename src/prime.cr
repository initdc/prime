def prime?(num)
  return true if num < 4
  (2..num / 2).each do |div|
    return false if num % div == 0
  end
  true
end

count = 0
duration = Time.measure do
  (2..250000).each do |num|
    count += 1 if prime?(num)
  end
end
puts "count   : #{count}"
puts "duration: #{duration}"
