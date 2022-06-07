from random import shuffle

fake_flag = b"FAKE{hooray_strings_is_always_an_useful_command}"
real_flag = b"AIS3{You_are_the_master_of_time_management!!!!!}"
xor_idx_list = list(range(len(real_flag) // 4))
while (xor_idx_list[0] == 0):
    shuffle(xor_idx_list)
print(xor_idx_list)

fake_flag_list = []
real_flag_list = []

for i in range(0, len(fake_flag), 4):
    fake_flag_list.append(fake_flag[i:i+4])
    fake_flag_list.append(int.to_bytes(xor_idx_list[i // 4], 1, 'little'))
    real_flag_list.append(real_flag[i:i+4])

# generate secret
secret = ", ".join(['"{}"'.format(el.decode().__repr__()[1:-1]) for el in fake_flag_list])

# generate key
key_list = [0] * 12
for i in range(0, len(fake_flag_list), 2):
    shuffle_idx = int.from_bytes(fake_flag_list[i+1], 'little')
    a = int.from_bytes(fake_flag_list[i], 'little')
    b = int.from_bytes(real_flag_list[i // 2], 'little')
    key_list[shuffle_idx] = a ^ b
key = ", ".join([hex(el) for el in key_list])

code = f'''#include <stdio.h>
#include <unistd.h>

const char secret[24][4] = {{
    {secret}
}};

const unsigned key[12] = {{
    {key}
}};


int main() {{
    unsigned int temp = 0;
    printf("Hope you have enough time to receive my flag:\\n");
    for (int i = 0; i < 24; i += 2) {{
        temp = *((unsigned int *)secret[i]) ^ key[*(unsigned int *)secret[i + 1]];
        for (int j = 0; j < 4; j++) {{
            sleep(0x8763);
            printf("%c", temp);
            temp /= 0x100;
            fflush(stdout);
        }}
    }}
    printf("\\rOops! Where is the flag? I am sure that the flag is already printed!\\n");
    return 0;
}}
'''

# print(code)
open('chal.c', 'w').write(code)
