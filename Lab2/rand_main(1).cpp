/* Lab 2, rand_main.cpp
*  Lydia Martin
*  January 18, 2024
*/

#include <iostream>
#include <cassert>
#include "lydia_random.h"
using namespace std;
using namespace coen79_lab2;

void printNumbers(rand_gen& rg, int num){
  //num  is number of times to print the information
  //how to use print_info() to generate the exact same output
  int i;
  for (i=0;i<num;i++){
    rg.print_info();
  }
}

int main(){
  
  rand_gen rg1(1,40,725,729);
  printNumbers(rg1, 5);
  rg1.set_seed(1);
  printNumbers(rg1, 5);
  rg1.set_seed(15);
  printNumbers(rg1, 5);
  
  rand_gen rg2(14,85,637,1947);
  printNumbers(rg2, 5);
  rg2.set_seed(14);
  printNumbers(rg2, 5);

  return 0;
}