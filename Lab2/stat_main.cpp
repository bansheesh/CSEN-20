/* Lab 2, stat_main.cpp
 *  Will Zumbolo
 *  January 18, 2024
 */

#include "will_statistician_v2.h"
#include <cassert>
#include <iostream>
#include <string>

using namespace std;
using namespace coen79_lab2;

void printinfo(statistician &s) {
  cout << "Sum: " << s.sum() << endl;
  cout << "Mean: " << s.mean() << endl;
  cout << "Smallest: " << s.minimum() << endl;
  cout << "Largest: " << s.maximum() << endl;
}

int main() {
  statistician s1, s2, s3;

  s1.next(1.1);
  printinfo(s1);
  s1.next(-2.4);
  printinfo(s1);
  s1.next(0.8);
  printinfo(s1);

  s2.next(5.7);
  printinfo(s2);
  s2.next(-3.8);
  printinfo(s2);
  s2.next(4.9);
  printinfo(s2);

  s3 = s1 + s2;
  printinfo(s3);

  s1.reset();
  s1.next(5);
  printinfo(s1);

  s2 = s1;
  printinfo(s1);

  s1.reset();
  s2.reset();
  s1.next(4);
  s2.next(4);
  if (s1 == s2) {
    cout << "s1 is equal to s2";
  }

  s1.reset();
  s1.next(4);
  s1.next(-2);
  printinfo(s1);

  s1 = -1 * s1;
  printinfo(s1);

  return (1);
}
