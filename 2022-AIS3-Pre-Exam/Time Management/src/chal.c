#include <stdio.h>
#include <unistd.h>

const char secret[24][4] = {
    "FAKE", "\x0b", "{hoo", "\n", "ray_", "\x02", "stri", "\x08", "ngs_", "\x06", "is_a", "\x05", "lway", "\x07", "s_an", "\x04", "_use", "\t", "ful_", "\x00", "comm", "\x01", "and}", "\x03"
};

const unsigned key[12] = {
    0x3a011001, 0x4c4c1b0d, 0x3a0b002d, 0x454f40, 0x3104321a, 0x3e2d161d, 0x2c120a31, 0xd3e1103, 0xc1a002c, 0x41d1432, 0x1a003100, 0x76180807
};


int main() {
    unsigned int temp = 0;
    printf("Hope you have enough time to receive my flag:\n");
    for (int i = 0; i < 24; i += 2) {
        temp = *((unsigned int *)secret[i]) ^ key[*(unsigned int *)secret[i + 1]];
        for (int j = 0; j < 4; j++) {
            sleep(0x8763);
            printf("%c", temp);
            temp /= 0x100;
            fflush(stdout);
        }
    }
    printf("\rOops! Where is the flag? I am sure that the flag is already printed!\n");
    return 0;
}
