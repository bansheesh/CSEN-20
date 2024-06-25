
//private variables are seed, multiplier, increment, and modulus
/*  Lab 2, random.cpp
 *  Lydia Martin
 *  January 18, 2024
 */
 
#include <cassert>
#include <iostream>
#include "lydia_random.h"
using namespace std;
using namespace coen79_lab2;

namespace coen79_lab2
{

  rand_gen::rand_gen(int seed, int multiplier, int increment, int modulus){
    this->seed = seed;
    this->modulus=modulus;
    this->multiplier=multiplier;
    this->increment=increment;
  }
    
  void rand_gen::set_seed(int new_seed){ //new seed comes from main
    seed = new_seed;
  }

  int rand_gen::next(){
    seed=(multiplier*seed+increment)%modulus;
    return seed;
  }
  
  void rand_gen::print_info(){
    cout<<"Seed: "<<seed<<endl;
    cout<<"Multiplier: "<<multiplier<<endl;
    cout<<"Increment: "<<increment<<endl;
    cout<<"Modulus: "<<modulus<<endl;
    cout<<"Next: "<<seed<<endl;
  }
}
