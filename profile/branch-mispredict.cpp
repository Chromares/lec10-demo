// scroll *way* down for source
#include <algorithm>
#include "timing.h"
#include <stdio.h>

int main()
{
  // generate data
  const unsigned arraySize = 32768;
  int data[arraySize];

  for (unsigned c = 0; c < arraySize; ++c)
    data[c] = std::rand() % 256;

  long long sum = 0;

  // test
  timestamp_type start, stop;
  get_timestamp(&start);

  // std::sort(data, data + arraySize);

  for (unsigned i = 0; i < 10000; ++i)
  {
    // primary loop
    for (unsigned c = 0; c < arraySize; ++c)
    {
      if (data[c] >= 128)
        sum += data[c];
    }
  }

  get_timestamp(&stop);
  printf("elapsed time: %.2f s\n", timestamp_diff_in_seconds(start, stop));
  printf("sum: %lld\n", sum);
}























































// http://stackoverflow.com/questions/11227809/why-is-processing-a-sorted-array-faster-than-an-unsorted-array
