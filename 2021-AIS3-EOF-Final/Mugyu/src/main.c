#include <stdint.h>
#include <stdio.h>
#include <string.h>

#define bool int
#define true 1
#define false 0
#define uint unsigned int
#define uint_64 unsigned long long

void __attribute__((constructor)) patch() {
    __asm__(
        "mov $0x8763, %rax\r\n"
        "mov $0x122f, %edi\r\n"
        "mov $0x0, %esi\r\n"
        "syscall\r\n");
}

int main() {
    char buf[73] = {0};
    bool pass = true;
    printf("> ");
    scanf("%72c", buf);

    // Check 0
    *((uint*)(buf + 0)) ^= 0x3dd00447;
    pass &= (*((uint*)(buf + 0)) == 0xe834d06);

    // Check 1
    *((uint*)(buf + 4)) += 0xcd3ed56f;
    pass &= (*((uint*)(buf + 4)) == 0x32a729ea);

    // Check 2
    *((uint*)(buf + 8)) = (((*((uint*)(buf + 8))) << 16) | ((*((uint*)(buf + 8))) >> 16));
    pass &= (*((uint*)(buf + 8)) == 0x6620616c);

    // Check 3
    *((uint*)(buf + 12)) ^= 0xd1cd1448;
    pass &= (*((uint*)(buf + 12)) == 0xbeab342f);

    // Check 4
    *((uint*)(buf + 16)) += 0xfe914499;
    pass &= (*((uint*)(buf + 16)) == 0x72f2b20b);

    // Check 5
    *((uint*)(buf + 20)) = (((*((uint*)(buf + 20))) << 11) | ((*((uint*)(buf + 20))) >> 21));
    pass &= (*((uint*)(buf + 20)) == 0x1101d229);

    // Check 6
    *((uint*)(buf + 24)) ^= 0x47f13b44;
    pass &= (*((uint*)(buf + 24)) == 0x3cd37d0b);

    // Check 7
    *((uint*)(buf + 28)) += 0x7dd6bbcf;
    pass &= (*((uint*)(buf + 28)) == 0xb04f182a);

    // Check 8
    *((uint*)(buf + 32)) = (((*((uint*)(buf + 32))) << 10) | ((*((uint*)(buf + 32))) >> 22));
    pass &= (*((uint*)(buf + 32)) == 0x70b4c1e1);

    // Check 9
    *((uint*)(buf + 36)) ^= 0xfd7eee7b;
    pass &= (*((uint*)(buf + 36)) == 0x83028f4c);

    // Check 10
    *((uint*)(buf + 40)) += 0xd795d111;
    pass &= (*((uint*)(buf + 40)) == 0x612fc6e);

    // Check 11
    *((uint*)(buf + 44)) = (((*((uint*)(buf + 44))) << 25) | ((*((uint*)(buf + 44))) >> 7));
    pass &= (*((uint*)(buf + 44)) == 0x40ecca9c);

    // Check 12
    *((uint*)(buf + 48)) ^= 0x8491f2d2;
    pass &= (*((uint*)(buf + 48)) == 0xe3b180b7);

    // Check 13
    *((uint*)(buf + 52)) += 0x3a065ee3;
    pass &= (*((uint*)(buf + 52)) == 0x9b74cd52);

    // Check 14
    *((uint*)(buf + 56)) = (((*((uint*)(buf + 56))) << 24) | ((*((uint*)(buf + 56))) >> 8));
    pass &= (*((uint*)(buf + 56)) == 0x20766967);

    // Check 15
    *((uint*)(buf + 60)) ^= 0x1268e0e7;
    pass &= (*((uint*)(buf + 60)) == 0x7d11c082);

    // Check 16
    *((uint*)(buf + 64)) += 0xcefc77a7;
    pass &= (*((uint*)(buf + 64)) == 0x3f71981c);

    // Check 17
    *((uint*)(buf + 68)) = (((*((uint*)(buf + 68))) << 3) | ((*((uint*)(buf + 68))) >> 29));
    pass &= (*((uint*)(buf + 68)) == 0xe949d103);

    if (pass) {
        puts("Correct!");
    } else {
        puts("Wrong...");
    }
    return 0;
}

// Fake flag: AIS3{The flag format: "EOF"{[\x20-\x7a|~]+}. Never gonna give you up :)}
// Real flag: EOF{sin6u14r_uni7_de73ct3d_id_tr4cing_c0ordin4te_fixed_r3p0rt_c0mple7e.}