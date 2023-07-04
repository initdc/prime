def prime?(num)
  return true if num < 4
  (3..num / 3).each do |div|
    return false if num % div == 0
  end
  true
end

count = 0
start = Time.now
(1..250000).step(2) do |num|
  count += 1 if prime?(num)
end
finish = Time.now
duration = (finish.tv_sec - start.tv_sec) + (finish.tv_nsec - start.tv_nsec) * 1e-9

puts "count   : #{count}"
puts format("duration: %.9fs", duration)
