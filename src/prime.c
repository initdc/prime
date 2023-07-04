#include <stdio.h>
#include <stdbool.h>
#include <time.h>

bool is_prime(int num)
{
  if (num < 4)
  {
    return true;
  }
  for (int i = 3; i <= num / 3; i++)
  {
    if (num % i == 0)
    {
      return false;
    }
  }
  return true;
}

int main()
{
  int count = 0;
  struct timespec start, finish;
  clock_gettime(CLOCK_REALTIME, &start);

  for (int i = 1; i <= 250000; i += 2)
  {
    if (is_prime(i))
    {
      count++;
    }
  }

  clock_gettime(CLOCK_REALTIME, &finish);
  float duration = (finish.tv_sec - start.tv_sec) + (finish.tv_nsec - start.tv_nsec) * 1e-9;
  printf("count   : %d\n", count);
  printf("duration: %.9fs\n", duration);
}
