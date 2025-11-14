#include <iostream>
using namespace std;

void bar() {
    throw 123;
}

void foo() {
    try {
        bar();            // <-- call site
    } catch (int x) {      // <-- catch handler
        cout << "caught " << x << endl;
    }
}

int main() {
    foo();
}
