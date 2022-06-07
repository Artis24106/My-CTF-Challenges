_start:
;;; generate flag length 55
    sav 11
    sav 2
    dup
    mul
    inc
    mul                 ; len = 55

cl_loop:
    sai
    jz check_length

    dec
    dup 
    jl exit1            ; `len` should not less than 0

    nei
    jmp cl_loop

exit1:
    debug 1
    exit

check_length:
    debug 0
    jnz exit1    

    ; pass flag length check!
    debug 87

;;; start checking
    sav 135             ; key = 0x87


chk0:
    dup
    pri                 ; inp--
    sai
    add                 ; inp += key
    xor                 ; inp ^= key
    dup                 ; key = inp
    sav 131             ; check1
    debug 0
    cmp
    jz chk1
    exit


chk1:
    dup
    pri                 ; inp--
    sai
    add                 ; inp += key
    xor                 ; inp ^= key
    dup                 ; key = inp
    sav 53             ; check2
    debug 1
    cmp
    jz chk2
    exit


chk2:
    dup
    pri                 ; inp--
    sai
    add                 ; inp += key
    xor                 ; inp ^= key
    dup                 ; key = inp
    sav 146             ; check3
    debug 2
    cmp
    jz chk3
    exit


chk3:
    dup
    pri                 ; inp--
    sai
    add                 ; inp += key
    xor                 ; inp ^= key
    dup                 ; key = inp
    sav 99             ; check4
    debug 3
    cmp
    jz chk4
    exit


chk4:
    dup
    pri                 ; inp--
    sai
    add                 ; inp += key
    xor                 ; inp ^= key
    dup                 ; key = inp
    sav 219             ; check5
    debug 4
    cmp
    jz chk5
    exit


chk5:
    dup
    pri                 ; inp--
    sai
    add                 ; inp += key
    xor                 ; inp ^= key
    dup                 ; key = inp
    sav 157             ; check6
    debug 5
    cmp
    jz chk6
    exit


chk6:
    dup
    pri                 ; inp--
    sai
    add                 ; inp += key
    xor                 ; inp ^= key
    dup                 ; key = inp
    sav 97             ; check7
    debug 6
    cmp
    jz chk7
    exit


chk7:
    dup
    pri                 ; inp--
    sai
    add                 ; inp += key
    xor                 ; inp ^= key
    dup                 ; key = inp
    sav 199             ; check8
    debug 7
    cmp
    jz chk8
    exit


chk8:
    dup
    pri                 ; inp--
    sai
    add                 ; inp += key
    xor                 ; inp ^= key
    dup                 ; key = inp
    sav 57             ; check9
    debug 8
    cmp
    jz chk9
    exit


chk9:
    dup
    pri                 ; inp--
    sai
    add                 ; inp += key
    xor                 ; inp ^= key
    dup                 ; key = inp
    sav 83             ; check10
    debug 9
    cmp
    jz chk10
    exit


chk10:
    dup
    pri                 ; inp--
    sai
    add                 ; inp += key
    xor                 ; inp ^= key
    dup                 ; key = inp
    sav 215             ; check11
    debug 10
    cmp
    jz chk11
    exit


chk11:
    dup
    pri                 ; inp--
    sai
    add                 ; inp += key
    xor                 ; inp ^= key
    dup                 ; key = inp
    sav 216             ; check12
    debug 11
    cmp
    jz chk12
    exit


chk12:
    dup
    pri                 ; inp--
    sai
    add                 ; inp += key
    xor                 ; inp ^= key
    dup                 ; key = inp
    sav 209             ; check13
    debug 12
    cmp
    jz chk13
    exit


chk13:
    dup
    pri                 ; inp--
    sai
    add                 ; inp += key
    xor                 ; inp ^= key
    dup                 ; key = inp
    sav 200             ; check14
    debug 13
    cmp
    jz chk14
    exit


chk14:
    dup
    pri                 ; inp--
    sai
    add                 ; inp += key
    xor                 ; inp ^= key
    dup                 ; key = inp
    sav 195             ; check15
    debug 14
    cmp
    jz chk15
    exit


chk15:
    dup
    pri                 ; inp--
    sai
    add                 ; inp += key
    xor                 ; inp ^= key
    dup                 ; key = inp
    sav 55             ; check16
    debug 15
    cmp
    jz chk16
    exit


chk16:
    dup
    pri                 ; inp--
    sai
    add                 ; inp += key
    xor                 ; inp ^= key
    dup                 ; key = inp
    sav 147             ; check17
    debug 16
    cmp
    jz chk17
    exit


chk17:
    dup
    pri                 ; inp--
    sai
    add                 ; inp += key
    xor                 ; inp ^= key
    dup                 ; key = inp
    sav 97             ; check18
    debug 17
    cmp
    jz chk18
    exit


chk18:
    dup
    pri                 ; inp--
    sai
    add                 ; inp += key
    xor                 ; inp ^= key
    dup                 ; key = inp
    sav 240             ; check19
    debug 18
    cmp
    jz chk19
    exit


chk19:
    dup
    pri                 ; inp--
    sai
    add                 ; inp += key
    xor                 ; inp ^= key
    dup                 ; key = inp
    sav 183             ; check20
    debug 19
    cmp
    jz chk20
    exit


chk20:
    dup
    pri                 ; inp--
    sai
    add                 ; inp += key
    xor                 ; inp ^= key
    dup                 ; key = inp
    sav 161             ; check21
    debug 20
    cmp
    jz chk21
    exit


chk21:
    dup
    pri                 ; inp--
    sai
    add                 ; inp += key
    xor                 ; inp ^= key
    dup                 ; key = inp
    sav 116             ; check22
    debug 21
    cmp
    jz chk22
    exit


chk22:
    dup
    pri                 ; inp--
    sai
    add                 ; inp += key
    xor                 ; inp ^= key
    dup                 ; key = inp
    sav 146             ; check23
    debug 22
    cmp
    jz chk23
    exit


chk23:
    dup
    pri                 ; inp--
    sai
    add                 ; inp += key
    xor                 ; inp ^= key
    dup                 ; key = inp
    sav 99             ; check24
    debug 23
    cmp
    jz chk24
    exit


chk24:
    dup
    pri                 ; inp--
    sai
    add                 ; inp += key
    xor                 ; inp ^= key
    dup                 ; key = inp
    sav 187             ; check25
    debug 24
    cmp
    jz chk25
    exit


chk25:
    dup
    pri                 ; inp--
    sai
    add                 ; inp += key
    xor                 ; inp ^= key
    dup                 ; key = inp
    sav 189             ; check26
    debug 25
    cmp
    jz chk26
    exit


chk26:
    dup
    pri                 ; inp--
    sai
    add                 ; inp += key
    xor                 ; inp ^= key
    dup                 ; key = inp
    sav 80             ; check27
    debug 26
    cmp
    jz chk27
    exit


chk27:
    dup
    pri                 ; inp--
    sai
    add                 ; inp += key
    xor                 ; inp ^= key
    dup                 ; key = inp
    sav 216             ; check28
    debug 27
    cmp
    jz chk28
    exit


chk28:
    dup
    pri                 ; inp--
    sai
    add                 ; inp += key
    xor                 ; inp ^= key
    dup                 ; key = inp
    sav 239             ; check29
    debug 28
    cmp
    jz chk29
    exit


chk29:
    dup
    pri                 ; inp--
    sai
    add                 ; inp += key
    xor                 ; inp ^= key
    dup                 ; key = inp
    sav 187             ; check30
    debug 29
    cmp
    jz chk30
    exit


chk30:
    dup
    pri                 ; inp--
    sai
    add                 ; inp += key
    xor                 ; inp ^= key
    dup                 ; key = inp
    sav 68             ; check31
    debug 30
    cmp
    jz chk31
    exit


chk31:
    dup
    pri                 ; inp--
    sai
    add                 ; inp += key
    xor                 ; inp ^= key
    dup                 ; key = inp
    sav 231             ; check32
    debug 31
    cmp
    jz chk32
    exit


chk32:
    dup
    pri                 ; inp--
    sai
    add                 ; inp += key
    xor                 ; inp ^= key
    dup                 ; key = inp
    sav 252             ; check33
    debug 32
    cmp
    jz chk33
    exit


chk33:
    dup
    pri                 ; inp--
    sai
    add                 ; inp += key
    xor                 ; inp ^= key
    dup                 ; key = inp
    sav 149             ; check34
    debug 33
    cmp
    jz chk34
    exit


chk34:
    dup
    pri                 ; inp--
    sai
    add                 ; inp += key
    xor                 ; inp ^= key
    dup                 ; key = inp
    sav 97             ; check35
    debug 34
    cmp
    jz chk35
    exit


chk35:
    dup
    pri                 ; inp--
    sai
    add                 ; inp += key
    xor                 ; inp ^= key
    dup                 ; key = inp
    sav 240             ; check36
    debug 35
    cmp
    jz chk36
    exit


chk36:
    dup
    pri                 ; inp--
    sai
    add                 ; inp += key
    xor                 ; inp ^= key
    dup                 ; key = inp
    sav 178             ; check37
    debug 36
    cmp
    jz chk37
    exit


chk37:
    dup
    pri                 ; inp--
    sai
    add                 ; inp += key
    xor                 ; inp ^= key
    dup                 ; key = inp
    sav 81             ; check38
    debug 37
    cmp
    jz chk38
    exit


chk38:
    dup
    pri                 ; inp--
    sai
    add                 ; inp += key
    xor                 ; inp ^= key
    dup                 ; key = inp
    sav 200             ; check39
    debug 38
    cmp
    jz chk39
    exit


chk39:
    dup
    pri                 ; inp--
    sai
    add                 ; inp += key
    xor                 ; inp ^= key
    dup                 ; key = inp
    sav 53             ; check40
    debug 39
    cmp
    jz chk40
    exit


chk40:
    dup
    pri                 ; inp--
    sai
    add                 ; inp += key
    xor                 ; inp ^= key
    dup                 ; key = inp
    sav 161             ; check41
    debug 40
    cmp
    jz chk41
    exit


chk41:
    dup
    pri                 ; inp--
    sai
    add                 ; inp += key
    xor                 ; inp ^= key
    dup                 ; key = inp
    sav 112             ; check42
    debug 41
    cmp
    jz chk42
    exit


chk42:
    dup
    pri                 ; inp--
    sai
    add                 ; inp += key
    xor                 ; inp ^= key
    dup                 ; key = inp
    sav 206             ; check43
    debug 42
    cmp
    jz chk43
    exit


chk43:
    dup
    pri                 ; inp--
    sai
    add                 ; inp += key
    xor                 ; inp ^= key
    dup                 ; key = inp
    sav 227             ; check44
    debug 43
    cmp
    jz chk44
    exit


chk44:
    dup
    pri                 ; inp--
    sai
    add                 ; inp += key
    xor                 ; inp ^= key
    dup                 ; key = inp
    sav 187             ; check45
    debug 44
    cmp
    jz chk45
    exit


chk45:
    dup
    pri                 ; inp--
    sai
    add                 ; inp += key
    xor                 ; inp ^= key
    dup                 ; key = inp
    sav 139             ; check46
    debug 45
    cmp
    jz chk46
    exit


chk46:
    dup
    pri                 ; inp--
    sai
    add                 ; inp += key
    xor                 ; inp ^= key
    dup                 ; key = inp
    sav 93             ; check47
    debug 46
    cmp
    jz chk47
    exit


chk47:
    dup
    pri                 ; inp--
    sai
    add                 ; inp += key
    xor                 ; inp ^= key
    dup                 ; key = inp
    sav 150             ; check48
    debug 47
    cmp
    jz chk48
    exit


chk48:
    dup
    pri                 ; inp--
    sai
    add                 ; inp += key
    xor                 ; inp ^= key
    dup                 ; key = inp
    sav 109             ; check49
    debug 48
    cmp
    jz chk49
    exit


chk49:
    dup
    pri                 ; inp--
    sai
    add                 ; inp += key
    xor                 ; inp ^= key
    dup                 ; key = inp
    sav 201             ; check50
    debug 49
    cmp
    jz chk50
    exit


chk50:
    dup
    pri                 ; inp--
    sai
    add                 ; inp += key
    xor                 ; inp ^= key
    dup                 ; key = inp
    sav 141             ; check51
    debug 50
    cmp
    jz chk51
    exit


chk51:
    dup
    pri                 ; inp--
    sai
    add                 ; inp += key
    xor                 ; inp ^= key
    dup                 ; key = inp
    sav 77             ; check52
    debug 51
    cmp
    jz chk52
    exit


chk52:
    dup
    pri                 ; inp--
    sai
    add                 ; inp += key
    xor                 ; inp ^= key
    dup                 ; key = inp
    sav 237             ; check53
    debug 52
    cmp
    jz chk53
    exit


chk53:
    dup
    pri                 ; inp--
    sai
    add                 ; inp += key
    xor                 ; inp ^= key
    dup                 ; key = inp
    sav 219             ; check54
    debug 53
    cmp
    jz chk54
    exit


chk54:
    dup
    pri                 ; inp--
    sai
    add                 ; inp += key
    xor                 ; inp ^= key
    sav 199             ; check55
    debug 54
    cmp
    jz chk55
    exit

chk55:
    debug 2

    out 103
    out 111
    out 111
    out 100
    out 32
    out 58
    out 41
    out 10

    exit
