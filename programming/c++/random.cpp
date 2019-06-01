#include <random>

std::random_device rd;
std::mt19937 mt(rd());
std::uniform_real_distribution<double> real_distribution(1.0, 10.0);
std::uniform_int_distribution<int> int_distribution(1, 10);
