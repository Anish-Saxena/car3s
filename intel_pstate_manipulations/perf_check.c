#include <stdio.h>

int main (void)
{
  volatile unsigned long long i;
  for (i = 0; i < 1000000000ULL; ++i);
  return 0;
}
