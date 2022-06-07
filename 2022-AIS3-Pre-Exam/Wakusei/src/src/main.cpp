#include <iostream>

#include "emulator.h"

using namespace std;

int main(int argc, char* argv[]) {
    if (argc < 2) {
        cout << "Usage: ./wakusei <flag>" << endl;
        exit(0);
    }

    Emulator cpu(argv[1]);
    cpu.run();

    return 0;
}