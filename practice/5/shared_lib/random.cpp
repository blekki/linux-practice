#include "stdlib.h"
#include "random.h"

int Random::randiRange(int min, int max) {
    return std::rand() % (max - min) + min;
}