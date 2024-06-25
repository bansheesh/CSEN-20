/* Lab 2, statistician.cpp
 *  Will Zumbolo
 *  January 18, 2024
 */

#include "will_statistician_v2.h"
#include <cassert>
#include <iostream>

using namespace std;
using namespace coen79_lab2;

namespace coen79_lab2 {

statistician::statistician() {
  total = 0;
  min = 0;
  max = 0;
  len = 0;
}

void statistician::next(double n) {
  if (len == 0) {
    max = n;
    min = n;
  }
  len++;
  total += n;
  // Updates min and max
  if (n > max) {
    max = n;
  }
  if (n < min) {
    min = n;
  }
}
int statistician::length() const { return len; }

double statistician::sum() const { return total; }

double statistician::mean() const {
  assert(len > 0);
  return total / len;
}

double statistician::minimum() const {
  assert(len > 0);
  return min;
}

double statistician::maximum() const {
  assert(len > 0);
  return max;
}

void statistician::reset() {
  len = 0;
  total = 0;
  min = 0;
  max = 0;
}

statistician operator+(const statistician &s1, const statistician &s2) {
  statistician s3;
  s3.len = s1.len + s2.len;
  s3.total = s1.total + s2.total;
  if(s1.minimum()<s2.minimum()){
    s3.min = s1.min;
  }
  else{
    s3.min = s2.min;
  }
  if(s1.maximum()>s2.maximum()){
    s3.max = s1.max;
  }
  else{
    s3.max = s2.max;
  }
  return s3;
}

statistician operator*(double scale, const statistician &s) {
  statistician s1;
  s1.total = s.total * scale;
  s1.min = s.min * scale;
  s1.max = s.max * scale;
  s1.len = s.len;
  if (scale < 0) {
    int temp = s1.min;
    s1.min = s1.max;
    s1.max = temp;
  }
  return s1;
}

bool operator==(const statistician &s1, const statistician &s2) {
  if (s2.length() == 0 && s1.length() == 0) {
    return true;
  } else {
    if (s2.length() == s1.length() && s2.sum() == s1.sum() &&
        s2.minimum() == s1.minimum() && s2.maximum() == s1.maximum()) {
      return true;
    }
    return false;
  }
}

} // namespace coen79_lab2