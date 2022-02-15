package main

import (
	"bytes"
	"fmt"
	"os"
	"runtime"
	"sync"
)

var input []byte
var wg sync.WaitGroup

func init() {
	runtime.GOMAXPROCS(1)
}

func node_ad61() {
	// fmt.Printf("'node_ad61', ")
	defer wg.Done()
	input[39] += 0x1a
	input[14] += 0x4e
	input[8] ^= input[11]
	go node_f73a()
	go node_e0c5()
	go node_1a5f()
}
func node_11cb() {
	// fmt.Printf("'node_11cb', ")
	defer wg.Done()
	input[36] += 0xbe
	input[35] += 0xc
	input[16] *= 0x57

}
func node_9767() {
	// fmt.Printf("'node_9767', ")
	defer wg.Done()
	input[7] ^= input[19]
	input[6] *= 0x1b
	input[13] += 0xd8

}
func node_ce5b() {
	// fmt.Printf("'node_ce5b', ")
	defer wg.Done()
	input[21] *= 0x9
	input[25] *= 0xa5
	input[41] += 0x2d

}
func node_b93b() {
	// fmt.Printf("'node_b93b', ")
	defer wg.Done()
	input[9] ^= input[0]
	input[44] *= 0x1d
	input[10] *= 0xd1

}
func node_5edb() {
	// fmt.Printf("'node_5edb', ")
	defer wg.Done()
	input[20] *= 0xf7
	input[5] += 0xb5
	input[1] ^= input[44]

}
func node_3399() {
	// fmt.Printf("'node_3399', ")
	defer wg.Done()
	input[22] *= 0x57
	input[33] += 0xc7
	input[16] += 0xbb
	go node_0b8c()
	go node_ef79()
	go node_f0b3()
}
func node_ffcf() {
	// fmt.Printf("'node_ffcf', ")
	defer wg.Done()
	input[13] += 0xcd
	input[33] += 0x89
	input[31] ^= input[18]

}
func node_543a() {
	// fmt.Printf("'node_543a', ")
	defer wg.Done()
	input[40] *= 0x6d
	input[32] += 0xfd
	input[35] ^= input[42]
	go node_13b8()
	go node_ef39()
	go node_9ed6()
}
func node_6914() {
	// fmt.Printf("'node_6914', ")
	defer wg.Done()
	input[0] += 0xc
	input[10] += 0x8a
	input[19] *= 0x67

}
func node_8adf() {
	// fmt.Printf("'node_8adf', ")
	defer wg.Done()
	input[30] += 0x53
	input[11] ^= input[41]
	input[38] ^= input[22]

}
func node_a783() {
	// fmt.Printf("'node_a783', ")
	defer wg.Done()
	input[6] += 0xa9
	input[0] ^= input[33]
	input[15] ^= input[8]

}
func node_3da5() {
	// fmt.Printf("'node_3da5', ")
	defer wg.Done()
	input[1] += 0x94
	input[42] *= 0x7d
	input[26] *= 0xf1
	go node_feb3()
	go node_a6af()
	go node_ad61()
}
func node_13b8() {
	// fmt.Printf("'node_13b8', ")
	defer wg.Done()
	input[17] *= 0x1d
	input[44] ^= input[19]
	input[27] ^= input[1]

}
func node_ef39() {
	// fmt.Printf("'node_ef39', ")
	defer wg.Done()
	input[22] ^= input[5]
	input[21] ^= input[4]
	input[14] *= 0xd1

}
func node_0229() {
	// fmt.Printf("'node_0229', ")
	defer wg.Done()
	input[5] += 0x43
	input[42] ^= input[4]
	input[30] *= 0x55

}
func node_524a() {
	// fmt.Printf("'node_524a', ")
	defer wg.Done()
	input[27] *= 0xb
	input[24] *= 0xaf
	input[25] ^= input[19]
	go node_ed1c()
	go node_f628()
	go node_89d6()
}
func node_a6af() {
	// fmt.Printf("'node_a6af', ")
	defer wg.Done()
	input[38] *= 0x23
	input[8] *= 0xb9
	input[22] += 0xd0
	go node_0e82()
	go node_e7b5()
	go node_ce1a()
}
func node_4fa2() {
	// fmt.Printf("'node_4fa2', ")
	defer wg.Done()
	input[36] *= 0x15
	input[43] ^= input[35]
	input[40] += 0x78

}
func node_0b8c() {
	// fmt.Printf("'node_0b8c', ")
	defer wg.Done()
	input[28] ^= input[26]
	input[16] ^= input[6]
	input[3] += 0xe3

}
func node_f016() {
	// fmt.Printf("'node_f016', ")
	defer wg.Done()
	input[3] ^= input[0]
	input[14] ^= input[29]
	input[7] += 0x27

}
func node_0e82() {
	// fmt.Printf("'node_0e82', ")
	defer wg.Done()
	input[36] ^= input[1]
	input[24] += 0x24
	input[2] += 0x8a

}
func node_f628() {
	// fmt.Printf("'node_f628', ")
	defer wg.Done()
	input[34] += 0x4e
	input[20] ^= input[8]
	input[38] += 0x3
	go node_6914()
	go node_9767()
	go node_b0af()
}
func node_e7b5() {
	// fmt.Printf("'node_e7b5', ")
	defer wg.Done()
	input[5] += 0x91
	input[42] += 0xbf
	input[1] *= 0x5b

}
func node_feb3() {
	// fmt.Printf("'node_feb3', ")
	defer wg.Done()
	input[31] *= 0xe3
	input[2] ^= input[26]
	input[37] ^= input[0]
	go node_5edb()
	go node_f016()
	go node_76ea()
}
func node_89d6() {
	// fmt.Printf("'node_89d6', ")
	defer wg.Done()
	input[5] += 0xb9
	input[32] *= 0xcd
	input[3] *= 0x55
	go node_a783()
	go node_11cb()
	go node_0229()
}
func node_b0af() {
	// fmt.Printf("'node_b0af', ")
	defer wg.Done()
	input[28] ^= input[6]
	input[31] += 0x1d
	input[5] ^= input[7]

}
func node_1a5f() {
	// fmt.Printf("'node_1a5f', ")
	defer wg.Done()
	input[10] += 0xe
	input[38] *= 0x31
	input[41] ^= input[43]

}
func node_f73a() {
	// fmt.Printf("'node_f73a', ")
	defer wg.Done()
	input[6] ^= input[17]
	input[23] ^= input[10]
	input[27] ^= input[41]

}
func node_ce1a() {
	// fmt.Printf("'node_ce1a', ")
	defer wg.Done()
	input[0] *= 0xcb
	input[40] ^= input[0]
	input[18] += 0x4f

}
func node_e0c5() {
	// fmt.Printf("'node_e0c5', ")
	defer wg.Done()
	input[26] += 0x33
	input[13] ^= input[44]
	input[8] += 0x97

}
func node_ed1c() {
	// fmt.Printf("'node_ed1c', ")
	defer wg.Done()
	input[12] ^= input[35]
	input[34] *= 0x63
	input[18] ^= input[19]
	go node_4fa2()
	go node_8dce()
	go node_b93b()
}
func node_f0b3() {
	// fmt.Printf("'node_f0b3', ")
	defer wg.Done()
	input[9] += 0xdd
	input[20] += 0x7a
	input[29] *= 0x7b

}
func node_ef79() {
	// fmt.Printf("'node_ef79', ")
	defer wg.Done()
	input[34] ^= input[19]
	input[28] *= 0x65
	input[37] *= 0x3d

}
func node_8dce() {
	// fmt.Printf("'node_8dce', ")
	defer wg.Done()
	input[42] += 0xa8
	input[31] += 0xd
	input[12] *= 0x77

}
func node_ebce() {
	// fmt.Printf("'node_ebce', ")
	defer wg.Done()
	input[4] ^= input[20]
	input[4] *= 0x9b
	input[25] += 0x98
	go node_8adf()
	go node_ffcf()
	go node_ce5b()
}
func node_76ea() {
	// fmt.Printf("'node_76ea', ")
	defer wg.Done()
	input[30] ^= input[11]
	input[5] *= 0xe3
	input[19] += 0x3a

}
func node_ea4a() {
	// fmt.Printf("'node_ea4a', ")
	defer wg.Done()
	input[39] ^= input[36]
	input[9] *= 0xdd
	input[11] ^= input[24]
	go node_ebce()
	go node_543a()
	go node_3399()
}
func node_9ed6() {
	// fmt.Printf("'node_9ed6', ")
	defer wg.Done()
	input[33] *= 0x21
	input[21] += 0x67
	input[7] *= 0xb3

}

func main() {
	ans := []byte{34, 62, 186, 5, 67, 200, 19, 226, 220, 93, 198, 242, 153, 47, 163, 178, 67, 253, 79, 96, 157, 113, 155, 12, 222, 152, 162, 35, 203, 125, 128, 193, 211, 30, 69, 144, 93, 168, 224, 114, 245, 47, 19, 163, 221}
	wg = sync.WaitGroup{}
	if len(os.Args) < 2 || len(os.Args[1]) != 45 {
		fmt.Println(":-(")
		return
	}
	input = []byte(os.Args[1])
	// input = []byte("w3_4r3_901ng_70_raffl3_0fF_A_g0...g0-r0u71n3!")

	wg.Add(39)

	go node_ea4a()
	go node_3da5()
	go node_524a()

	wg.Wait()

	// fmt.Println(input)

	if bytes.Equal(input, ans) {
		fmt.Printf("Correct! EOF{%s}\n", os.Args[1])
	} else {
		fmt.Println("Wrong...")
	}
}
