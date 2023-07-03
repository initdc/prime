import std/times

proc isPrime(num: int): bool =
  if num < 4:
    return true
  
  for dv in 2..(toInt(num/2)):
    if num mod dv == 0:
      return false
  return true

var count = 0
let start = cpuTime()
for nm in 2..250000:
  if isPrime(nm):
    count += 1

let finish = cpuTime()
let duration = finish - start

echo "count   : ", count
echo "duration: ", duration
