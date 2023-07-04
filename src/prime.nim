import std/times

proc isPrime(num: int): bool =
  if num < 4:
    return true
  
  for dv in 3..(toInt(num/3)):
    if num mod dv == 0:
      return false
  return true

var count = 0
let start = cpuTime()
for nm in countup(1, 250000, 2):
  if isPrime(nm):
    count += 1

let finish = cpuTime()
let duration = finish - start

echo "count   : ", count
echo "duration: ", duration
