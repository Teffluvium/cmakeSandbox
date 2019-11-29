#include <iostream>

#include <UnitTest++/UnitTest++.h>

int main() {
    std::cout << "Hello World\n";
#ifdef Darwin
    std::cout << "You're on Apple\n";
#else
    #ifdef Linux
        std::cout << "You're on Linux\n";
    #else
        std::cout << "This ain't a Mac or Linux\n";
    #endif
#endif
    return 0;
}
