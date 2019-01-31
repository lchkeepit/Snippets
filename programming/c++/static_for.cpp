// https://stackoverflow.com/questions/11081573/passing-a-variable-as-a-template-argument
#include <iostream>

template <int i>
void modify() {
  std::cout << "modify<" << i << ">" << std::endl;
}

template <int x, int to>
struct static_for {
  void operator()() {
    modify<x>();
    static_for<x + 1, to>()();
  }
};

template <int to>
struct static_for<to, to> {
  void operator()() {}
};

int main() { static_for<0, 10>()(); }
